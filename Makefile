# Projects related
PROJECT=Scope

# colorcodes
C_G=\033[0;32m
C_R=\033[0;31m
C_B=\033[0;34m
C_E=\033[0m

# Docker related
F_RUST_DOCKER="rust"
TRUE=abc
FALSE=abc


all:


# Frist menu
help:
	@echo "\nChoose one the folling option\n"
	@echo "$(C_G)make compile$(C_E)| comile the project"
	@echo "$(C_G)make run    $(C_E)| to run the programm with default file"
	@echo "$(C_G)make docker $(C_E)| to pull and start the dockerfiles"
	@echo "$(C_G)make rust   $(C_E)| install rust on the machine"
	@echo "$(C_G)make clean  $(C_E)| to remove things'.obj etc'"
	@echo "$(C_G)make fclean $(C_E)| to remove more things"


# checks if docker is running// not sure if i run the docker init thing but atleast link it here
# will not check if Docker_innit(42school related) was used
docker_check:
	@open -a Docker
	@until [ "`docker inspect -f {{.State.Running}} CONTAINERNAME`"=="true" ]; do
		sleep 0.1;
		echo waiting
	done;
	@echo  "$(C_R)Docker is not running$(C_E)"
	@docker images | grep "rust" | 


# pulls the latest images for the docker // maybe change to dockercompose // version controlled images
docker: docker_check
	docker pull $(F_RUST_DOCKER)

# remove everthing docker related
fclean_docker:
	docker rmi $(F_RUST_DOCKER)
clean:

fclean:

rust:


.PHONY: all docker fclean_docker clean fclean rust