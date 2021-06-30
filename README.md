# dotfiles

### Install to ~/.dotfiles

```sh
git clone git@github.com:fishberg/dotfiles.git ~/.dotfiles
```

### Install on Fresh System

```sh
curl -sLf https://raw.githubusercontent.com/fishberg/dotfiles/master/install/install-fresh.sh | bash
```

### Vim Plug Setup

https://github.com/junegunn/vim-plug

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

`:PlugInstall`

### NeoVim Plug Setup

https://github.com/junegunn/vim-plug

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

`:PlugInstall`

### Vim Plugins

https://github.com/vim-airline/vim-airline

