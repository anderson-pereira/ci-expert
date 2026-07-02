#!/bin/bash

# 1. configure DISPLAY for x2go session
RAW_DISPLAY=$(ps eww -u $USER | grep -o -m 1 '[D]ISPLAY=nx/nx[^ ]*')

if [ -z "$RAW_DISPLAY" ]; then
    echo "No x2go session found."
else
    DISPLAY_NUM=${RAW_DISPLAY##*:}
    export DISPLAY=":$DISPLAY_NUM"
    echo "✅ Success! DISPLAY configured to $DISPLAY"
fi

# 2. Start the Synopsys environment
source /Tools/synopsys/snps.sh