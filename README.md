# dotfiles

### Install to ~/.dotfiles

```bash
sudo apt upgrade -y
sudo apt update -y
sudo apt install -y git
git clone https://github.com/fishberg/dotfiles ~/.dotfiles
cd ~/.dotfiles/install
```

### Install on Fresh System

```bash
wget -O - https://raw.githubusercontent.com/fishberg/dotfiles/master/install/quick-start.bash | bash -s
```

```bash
curl -sLf https://raw.githubusercontent.com/fishberg/dotfiles/master/install/quick-start.bash | bash -s
```
