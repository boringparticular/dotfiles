### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# zinit light zsh-users/zsh-completions
# zinit light zsh-users/zsh-syntax-highlighting
zinit light zdharma-continuum/fast-syntax-highlighting
# zinit light zsh-users/zsh-history-substring-search
# zinit light zsh-users/zsh-autosuggestions

zinit snippet PZTM::history
zinit snippet PZTM::directory
zinit snippet PZTM::editor
zinit snippet PZTM::command-not-found
zinit ice svn
zinit snippet PZTM::git
zinit snippet PZTM::ssh

zstyle ':prezto:ssh:load' identities 'id_rsa' 'id_ed25519'

zinit snippet PZTM::completion
# zinit snippet PZTM::syntax-highlighting

zinit ice \
    atclone"git clone --recursive https://github.com/zsh-users/zsh-history-substring-search.git external" \
    blockf
zinit snippet PZTM::history-substring-search

zinit ice \
    atclone"git clone --recursive https://github.com/zsh-users/zsh-autosuggestions.git external" \
    blockf
zinit snippet PZTM::autosuggestions

zinit ice depth=1; zinit light romkatv/powerlevel10k

# zinit light spaceship-prompt/spaceship-prompt

# eval "$(starship init zsh)"

source $ZDOTDIR/include.zsh

# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f ~/.zsh/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh
