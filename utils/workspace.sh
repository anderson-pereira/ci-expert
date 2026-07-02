#!/bin/bash

ACTION=$1
TARGET_DIR=${2:-.}
SCRIPT_NAME=$(basename "$0")

# Function to display script usage/help
show_help() {
    echo "Usage: $0 {lock|unlock} [target_directory]"
    echo ""
    echo "Options:"
    echo "  lock     Compress, encrypt, and bundle the target directory contents into a self-extracting script"
    echo "  unlock   Standard decryption for 'workspace.tar.gz.gpg' (Fallback)"
    echo ""
    echo "Optional Arguments:"
    echo "  [target_directory]  The directory whose contents will be locked (Default: current directory)"
    exit 1
}

# Check if an action was provided, otherwise show help
if [ -z "$ACTION" ]; then
    show_help
fi

# Navigate to the target directory before executing actions
if [ ! -d "$TARGET_DIR" ]; then
    echo "ERROR: Target directory '$TARGET_DIR' does not exist."
    exit 1
fi

cd "$TARGET_DIR" || exit 1

case "$ACTION" in
    lock)
        echo "Encrypting and packaging contents of '$TARGET_DIR' into a self-extracting script..."
        tar -czf - --exclude="$SCRIPT_NAME" --exclude="unlock_workspace.sh" --exclude=".workspace.tar.gz.gpg.tmp" . | gpg -c --pinentry-mode loopback -o .workspace.tar.gz.gpg.tmp 2>/dev/null

        if [ -f .workspace.tar.gz.gpg.tmp ]; then
            cat << 'EOF' > unlock_workspace.sh
#!/bin/bash
echo "========================================="
echo "        Project Workspace Unlock         "
echo "========================================="

# Check requirements
if ! command -v base64 &> /dev/null || ! command -v gpg &> /dev/null; then
    echo "ERROR: base64 or gpg command not found. Please install them."
    exit 1
fi

# Extract payload, decode base64, decrypt via GPG and untar into current directory
echo "Please enter the password to decrypt the workspace contents:"
sed '1,/^#---ENCODED_DATA_START---$/d' "$0" | base64 -d | gpg -d --pinentry-mode loopback | tar -xzf -

if [ $? -eq 0 ]; then
    echo "--> Contents successfully unlocked and restored!"
    echo "--> Self-destruction: Removing this unlock script..."
    rm -- "$0"
else
    echo "ERROR: Failed to extract contents. Password might be incorrect."
    exit 1
fi
exit 0
#---ENCODED_DATA_START---
EOF

            # Append the base64 encrypted data into the script
            base64 .workspace.tar.gz.gpg.tmp >> unlock_workspace.sh
            chmod +x unlock_workspace.sh
            rm -f .workspace.tar.gz.gpg.tmp
            
            # Deletes everything in the target directory EXCEPT this script and the new unlock script
            find . -maxdepth 1 ! -name '.' ! -name "$SCRIPT_NAME" ! -name 'unlock_workspace.sh' -exec rm -rf {} +
            
            echo "Directory contents successfully locked!"
            echo "Generated self-extracting script: '$TARGET_DIR/unlock_workspace.sh'"
        else
            echo "ERROR: Encryption failed. Keeping original files."
            exit 1
        fi
        ;;

    unlock)
        # Standard unlock fallback in case you manually have a .gpg file instead
        if [ ! -f "workspace.tar.gz.gpg" ]; then
            echo "ERROR: 'workspace.tar.gz.gpg' file not found in '$TARGET_DIR'."
            echo "If you generated the self-extracting script, just run: ./unlock_workspace.sh"
            exit 1
        fi

        echo "Decrypting workspace from standard .gpg file..."
        gpg -d workspace.tar.gz.gpg | tar -xzf -

        if [ $? -eq 0 ]; then
            rm -f workspace.tar.gz.gpg
            echo "Workspace successfully unlocked in '$TARGET_DIR'."
        else
            echo "ERROR: Extraction failed. Keeping the .gpg file."
            exit 1
        fi
        ;;

    *)
        echo "ERROR: Invalid option '$ACTION'."
        show_help
        ;;
esac