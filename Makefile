SHELL = /bin/bash
ROLE_NAME = role-redis
DOCKER_IMG = chn2guevara/molecule:latest

molecule-%:
	@docker run --rm -it -v $(shell pwd):/$(ROLE_NAME) \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
		--privileged \
		$(DOCKER_IMG) bash -c 'cd /$(ROLE_NAME) && molecule $*'
