#!/bin/bash
set -e

echo "Launching SSH Agent"
eval $(ssh-agent -s)

if [ -n "$SSH_KEY_DEPLOYER" ]; then
    echo "Adding ssh key"
    ssh-add <(echo "$SSH_KEY_DEPLOYER")  2>&1
else
    echo SSH_KEY_DEPLOYER is not set. No SSH key has been added 
fi

echo -e "Host *\n\tStrictHostKeyChecking $SSH_STRICT_HOST_KEY_CHECKING\n\n" > ~/.ssh/config

echo StrictHostKeyChecking is set to $SSH_STRICT_HOST_KEY_CHECKING

exec /bin/bash $@