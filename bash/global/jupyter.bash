# nbstripout
alias strip='nbstripout'
alias strip_all='nbstripout *.ipynb'

# nbconvert
alias ipynb_to_pdf='jupyter nbconvert --to pdf'
alias ipynb_to_py='jupyter nbconvert --to script'
alias ipynb_to_html='jupyter nbconvert --to html'

# jupytext
alias ipynb_sync_py='jupytext --set-formats ipynb,py:percent'

# git repo
ipynb_git_install() {
    nbstripout --install
    nbdime config-git --enable
}
