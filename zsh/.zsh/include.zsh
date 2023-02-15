setopt emacs

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PAGER="most"
export EDITOR=nvim
export VISUAL=nvim
export PATH=$HOME/.local/bin:${PATH}
export PATH=$HOME/bin:${PATH}
export PATH=$HOME/.cargo/bin:${PATH}
export VIMCONFIG=$HOME/.config/nvim
export VIMDATA=$HOME/.local/share/nvim

if [[ -x "$(command -v bat)" ]]; then
  alias cat="bat --paging=never"
fi

if [[ -x "$(command -v exa)" ]]; then
  alias ls=exa --icons
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

# Change directory with fuzzy find from https://github.com/jhawthorn/fzy
fcd() { cd $(find | fzy) }

# Fuzzy + nvim
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
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

    alias luamake=$HOME/code/lua-language-server/3rd/luamake/luamake

    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    # eval "$(pyenv init -)"
    # eval "$(pyenv virtualenv-init -)"
    source $(pyenv root)/completions/pyenv.zsh

    if [[ -f "$ZDOTDIR/personal.zsh" ]]; then
        source $ZDOTDIR/personal.zsh
    fi
fi

