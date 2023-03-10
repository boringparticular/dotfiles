setopt emacs

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PAGER="most"
export EDITOR=nvim
export VISUAL=nvim
export PATH=$HOME/.cargo/bin:${PATH}
export VIMCONFIG=$HOME/.config/nvim
export VIMDATA=$HOME/.local/share/nvim

alias chmod="chmod --preserve-root"
if [[ -x "$(command -v bat)" ]]; then
  alias cat="bat --paging=never"
fi

if [[ -x "$(command -v exa)" ]]; then
  alias ls=exa
  alias l='exa -l --all --group-directories-first --git'
  alias ll='exa -l --all --all --group-directories-first --git'
  alias lt='exa -T --git-ignore --level=2 --group-directories-first'
  alias llt='exa -lT --git-ignore --level=2 --group-directories-first'
  alias lT='exa -T --git-ignore --level=4 --group-directories-first'
else
  alias l='ls -lah'
  alias ll='ls -alF'
  alias la='ls -A'
fi

if [[ -x "$(command -v rg)" ]]; then
  alias grep=rg
fi

if [[ -x "$(command -v btm)" ]]; then
  alias top=btm
fi

alias vi=nvim
alias vim=nvim
alias docker=podman
alias vc="$EDITOR $HOME/.dotfiles/nvim/.config/nvim/init.lua"

# alias find=fd
# alias ps=procs
# alias sed=sd
# alias du=dust
# alias top=ytop 

# # Change directory with fuzzy find from https://github.com/jhawthorn/fzy
fcd() { cd $(find | fzy) }

# # Fuzzy + nvim
fvim() { nvim $(find | fzy) }

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ $HOSTNAME = "zeus" ]]; then
    # alias nvim="TERM=xterm-256:RGB nvim"
    # alias tmux="TERM=xterm tmux"

    eval "$(zoxide init zsh)"

    export PATH=/opt:${PATH}
    export PATH=$HOME/.poetry/bin:${PATH}
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH=$HOME/code/dart-sdk/sdk/out/ReleaseX64/dart-sdk/bin:${PATH}
    export PATH=$HOME/flutter/bin:${PATH}
    export PATH=$HOME/code/flutter/bin:${PATH}

    export PATH=$HOME/data/android/Sdk/tools:${PATH}
    export PATH=$HOE/data/android/Sdk/platform-tools:${PATH}
    export ANDROID_SDK_HOME=$HOME/data/android/Sdk

    # pnpm
    export PNPM_HOME="$HOME/.local/share/pnpm"
    export PATH="$PNPM_HOME:$PATH"
    # pnpm end

    export GOPATH=$HOME/go
    export PATH=/usr/local/go/bin:${PATH}
    export PATH=$GOPATH/bin:${PATH}

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    # [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

    alias luamake=$HOME/code/lua-language-server/3rd/luamake/luamake

    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    # eval "$(pyenv init -)"
    # eval "$(pyenv virtualenv-init -)"
    source $(pyenv root)/completions/pyenv.zsh

    if [[ -f "$ZDOTDIR/personal.zsh" ]]; then
        source $ZDOTDIR/personal.zsh
    fi

    if type clipcat-menu >/dev/null 2>&1; then
        alias clipedit=' clipcat-menu --finder=builtin edit'
        alias clipdel=' clipcat-menu --finder=builtin remove'

        bindkey -s '^\' "^Q clipcat-menu --finder=builtin insert ^J"
        bindkey -s '^]' "^Q clipcat-menu --finder=builtin remove ^J"
    fi

    alias gdl=~/gdl.sh
    alias jdl=~/jdl.sh
    alias cdl=~/cdl.sh
fi

