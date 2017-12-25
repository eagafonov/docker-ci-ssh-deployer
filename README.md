SSH Deployer for Gitlab-CI
==========================

Deploy helper to run SSH commands in secure manner.

Private SSH key need to be specified in SSH_KEY_DEPLOYER [secret variables](https://docs.gitlab.com/ce/ci/variables/README.html#secret-variables).

Here is an example of .gitlab-ci.yml to show how to use this image with Gitlab-CI


    stages:
        - deploy # define deploy stage 

    deploy-dev:
        type: deploy
        image: eagafonov/ci-ssh-deployer # us this image as base
        variables:
            SSH_STRICT_HOST_KEY_CHECKING: no
        script:
            - test -n "$SSH_KEY_DEPLOYER" # Just to make sure the SSH Key is defided in CI Settings
            # Run 'make deploy' on target host
            - ssh user@dhost.example.com make deploy
        only:
            - /^ci-dev-.*$/


## Environment variables

### SSH_STRICT_HOST_KEY_CHECKING

Value for `StrictHostKeyChecking` SSH option. Set to `no` to disable host key checking.

***Security notice*** Its totally unsafe to disable host key checking but suitable in some cases.
For example it's fine to disable it if SSH access is performed within secured private network so 
MITM is not possible.

Its much better to provide valid `known_hosts` files as `/home/safeuser/.ssh/known_hosts`.

### SSH_KEY_DEPLOYER

The content of private ssh to be added into ssh agent.


