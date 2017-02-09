echo "source $(/usr/local/bin/brew --prefix nvm)/nvm.sh" >> ~/.profile
source /usr/local/opt/nvm/nvm.sh

if test -f ~/.gnupg/.gpg-agent-info -a -n "$(pgrep gpg-agent)"; then
  source ~/.gnupg/.gpg-agent-info
  export GPG_AGENT_INFO
else
  eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi
export PATH="$PATH:`yarn global bin`"
