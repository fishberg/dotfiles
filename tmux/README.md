# tmux

Assuming you clone this repo as `~/.dotfiles`, you setup this config with:

```bash
ln -s $DOTFILES_ROOT/tmux/_tmux.conf ~/.tmux.conf
```

Initially source the config in a running tmux session with:
```
<C-b> :source-file ~/.tmux.conf
```

## Tmux Plugin Manager (tpm)
Install with:
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

[Reference](https://github.com/tmux-plugins/tpm)
