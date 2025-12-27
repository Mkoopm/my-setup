#!/bin/bash

# Initialize home if needed
if [ ! -f /home/developer/.initialized ]; then
  echo "🚀 First run, initializing home..."

  # Copy configs
  cp -r /opt/initial-config/.config /home/developer/ 2>/dev/null || true
  cp /opt/initial-config/.tmux.conf /home/developer/ 2>/dev/null || true

  # Create common dirs
  mkdir -p /home/developer/{workspace,projects,.local/bin}

  # Mark as initialized
  touch /home/developer/.initialized
  echo "✅ Home initialized!"
fi

# Execute the actual command (CMD or docker run command)
exec "$@"
