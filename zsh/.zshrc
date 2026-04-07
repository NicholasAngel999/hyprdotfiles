HISTFILE=~/.zsh_history
HISTFILE=10000
SAVEHIST=10000
setopt share_history
setopt hist_ignore_dups

setopt autocd
setopt correct

export EDITOR=nvim
export VISUAL=nvim

fastfetch


# ---- plugins ----
#
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#---- tools ---- 
#
eval "$(zoxide init zsh)"

eval "$(starship init zsh)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$HOME/.cargo/bin:$PATH"
