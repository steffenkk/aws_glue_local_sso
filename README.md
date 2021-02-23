# Glue in Docker for sso access 

TLDR: clone this & run 

```console
aws sso login
make start
```
- you may want to set the AWS_PROFILE or SCRIPT_DIR when using make e.g. ```make start AWS_PROFILE=dev```
- afterwards go to http://localhost:8888 and start developing

## Execution:
1. Pull the container with ```docker pull steffenkk/glue_local_sso:latest```
2. Run the container with ```docker run -p 8888:8888 -p 4040:4040 -v ~/.aws:/root/.aws:rw -v $(pwd)/glue:/home/jupyter/jupyter_default_dir  -e AWS_PROFILE=$AWS_DEFAULT_PROFILE steffenkk/glue_local_sso ```
    (Prerequisites: a local ```./glue``` repo containes the ipynb files & the env ```AWS_DEFAULT_PROFILE``` points to the profile you want to use or rename these)

## Development:
1. Build the container with an existing requirements.txt & a start.sh file
2. You cann add Jars to the classpath by adding them in the dockerfile (see "add json-serde to calsspath" in the file)
3. change sso process behavior in start.sh 
4. change the registry/user for dockerhub and push the image