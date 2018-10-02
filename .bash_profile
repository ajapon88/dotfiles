# BEGIN ANSIBLE MANAGED BLOCK bash
# load .bashrc
if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi
# END ANSIBLE MANAGED BLOCK bash
# BEGIN ANSIBLE MANAGED BLOCK rbenv
# rbenv
export PATH=${HOME}/.rbenv/bin:${PATH}
eval "$(rbenv init -)"
# END ANSIBLE MANAGED BLOCK rbenv
