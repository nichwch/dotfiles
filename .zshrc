# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=()

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git virtualenv)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

##########################
##########################
##########################
##########################
##########################
#### PERSONAL CONFIG #####
##########################
##########################
##########################
##########################
##########################
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

alias nenv='python3 -m venv ./.venv'
alias lenv='source ./.venv/bin/activate'
alias denv='deactivate'
alias reload="source ~/.zshrc"
alias save="git add * && git commit -m 'save' && git push origin" 
alias econf='vim ~/.zshrc'

# bun completions
[ -s "/Users/nicholaschen/.bun/_bun" ] && source "/Users/nicholaschen/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

fpath+=~/.zfunc
autoload -Uz compinit && compinit

# my configs

# some prompts for my gpt utilities
alias diff_summarize='echo "I am a software engineer working on a project, and I mentally lost track of where I am. Here is my git diff - can you catch me up on what I was doing? Be concise if you can. Thank you!"'

alias commit_message_prompt='echo "I am a software engineer working on a project, and I need a commit message for my changes. Here is my git diff. Can you write me a nice, concise commit message? Remember, a commit message should be a one liner, ideally less than 50 characters. On a separate line, write a description - this can be a little longer. Thank you!"' 

alias standup_summarize='echo "I am a software engineer working on a project, and I mentally lost track of where I am. Here are some diffs - can you catch me up on what I was doing? Be as concise as you can, and write them up in bullet points for a standup message. It should be no more than 5 bullet points. Do not bold or format the text, besides bullet points - I will be copy pasting this. Again, please output plain text. Write at a high level, without involving too many specifics, I want to respect my colleagues time. Thank you!"'

alias get_files='echo "I am a software engineer, and these are some very messy notes I took for a meeting. Can you extract out some key files and functions I should take a look at, and give a brief description of what they do?"'

# some gpt powered utilites
alias catchup='{ diff_summarize; git --no-pager diff} | sgpt'

alias commitm='{ commit_message_prompt; git --no-pager diff --cached} | sgpt'

alias explainlast='{ diff_summarize; git --no-pager show HEAD@{0}} | sgpt'

alias explainyest='{ diff_summarize; git log --since="1 day ago" --until="now"--author="$(git config user.name)" -p} | sgpt'

alias standup='{ standup_summarize; git log --since="1 day ago" --until="now"--author="$(git config user.name)" -p} | sgpt'

# Java/OpenJDK
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

alias dotfiles=/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME
