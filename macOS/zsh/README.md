# .zshrc

Assuming you clone this repo as `~/.dotfiles`, you can source these bash modifications by adding the following lines to your local `~/.zshrc` file:

```zsh
# installed helper files
export DOTFILES_ROOT="$HOME/.dotfiles"
source $DOTFILES_ROOT/macOS/zsh/smart-source.zsh
```
