SSH Deployer for Gitlab-CI
==========================

Deploy helper to sun SSH commands in secure manner.

Private SSH key need to be specified in SSH_KEY_DEPLOYER [secret variables](https://docs.gitlab.com/ce/ci/variables/README.html#secret-variables).

Here is an example of .gitlab-ci.yml to show how to use this image with Gitlab-CI


    stages:
        - deploy # define deploy stage 

    deploy-dev:
        type: deploy
        image: eagafonov/ci-ssh-deployer # us this image as base
        script:
            - test -n "$SSH_KEY_DEPLOYER" # Just to make sure the SSH Key is defided in CI Settings
            # Som magic to pass host key checks
            - mkdir -p ~/.ssh
            - echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config
            # Run 'make deploy' on target host
            - ssh user@dhost.example.com make deploy
        only:
            - /^ci-dev-.*$/






