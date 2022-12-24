# nvim

Assuming you clone this repo as `~/.dotfiles`, you setup this config with:

```bash
mkdir -p ~/.config/nvim
ln -s $DOTFILES_ROOT/nvim/init.vim ~/.config/nvim/init.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

`:PlugInstall`

* [Reference](https://github.com/junegunn/vim-plug)

### Plugins
* https://github.com/vim-airline/vim-airline
