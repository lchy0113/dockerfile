cat >> "/home/lchy0113/.bashrc" <<END_OF_FILE
# The ssh-agent config.
if [ -f ~/.ssh-agent.sh ]; then
	. ~/.ssh-agent.sh
fi
if [ ! -S $SSH_AUTH_SOCK ]; then
	ssh-agent -t 86400 > ~/.ssh-agent.sh
	echo "No agent~! ssh-agent started."
	. ~/.ssh-agent.sh
fi
END_OF_FILE

