# README

This is my zoxide tmux session manager. It allows you to create tmux sesions
based on the zoxide list of visited directories. It provides a session switcher
that also works inside tmux.

## Setup

Add the following to your shell rc (e.g. ~/.zshrc):

```shell
tmux bind-key -n C-f run-shell "$HOME/bin/tt"
```

The two binaries have to be added to the path. This can be done by symlinking
them from any directory in the path, like `~/bin` is on some systems.
