#!/bin/bash

if [ -n "$SSH_KEY_DEPLOYER" ]; then
    eval $(ssh-agent -s) 
    ssh-add <(echo "$SSH_KEY_DEPLOYER")  2>&1
fi

exec /bin/bash $@