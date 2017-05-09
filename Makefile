build:
	docker build -t eagafonov/ci-ssh-deployer .


run:
	docker run --rm -ti eagafonov/ci-ssh-deployer

push:
	docker push eagafonov/ci-ssh-deployer:latest
