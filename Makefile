.PHONY: start

SCRIPT_DIR=glue
AWS_PROFILE=default

start:
	docker run -d -p 8888:8888 -p 4040:4040 -v ~/.aws:/root/.aws:rw -v \
	$(shell pwd)/$(SCRIPT_DIR):/home/jupyter/jupyter_default_dir  \
	-e AWS_PROFILE=$(AWS_PROFILE) steffenkk/glue_local_sso:latest  