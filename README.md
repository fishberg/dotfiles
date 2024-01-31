# dotfiles

### Install to ~/.dotfiles

```bash
git clone git@github.com:fishberg/dotfiles.git ~/.dotfiles
echo 'export DOTFILES_ROOT="$HOME/.dotfiles"' >> ~/.bashrc
source ~/.bashrc
```

### Install on Fresh System

```bash
wget -O - https://raw.githubusercontent.com/fishberg/dotfiles/master/install/quick-start.bash | bash -s
```

```bash
curl -sLf https://raw.githubusercontent.com/fishberg/dotfiles/master/install/quick-start.bash | bash -s
```
