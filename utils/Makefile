lock:
	tar -czf - ./workspace | gpg -c -o workspace.tar.gz.gpg
	@if [ -f workspace.tar.gz.gpg ]; then \
		rm -rf ./workspace; \
		echo "Workspace locked"; \
	else \
		echo "ERROR: .gpg file not found. Keeping dir"; \
	fi
unlock:
	gpg -d workspace.tar.gz.gpg | tar -xzf -
	@if [ -d ./workspace ]; then \
		rm -f workspace.tar.gz.gpg; \
		echo "Workspace unlocked"; \
	else \
		echo "ERROR: workspace dir not found. Keeping .gpg"; \
	fi

