# for atcoder
alias act="oj t -c 'pypy3 main.py'"
alias acs="acc s main.py -- --guess-python-interpreter pypy"

alias open='xdg-open'

alias vim='nvim'

# cd -> auto ls
cd (){
    builtin cd "$@" && ls
}
