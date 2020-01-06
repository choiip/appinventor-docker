default: build_env

source:
	git clone --recursive https://github.com/mit-cml/appinventor-sources.git

TAG = appinventor-server
build_env:
	docker build --rm -t $(TAG)-env -f Dockerfile .

build_prod:
	docker build --rm -t $(TAG) -f prod.Dockerfile .

dev:
	docker run --rm -it \
			-e DISPLAY=${DISPLAY} \
       		-v /tmp/.X11-unix:/tmp/.X11-unix \
			-p 8888:8888 \
  			-v ${PWD}/appinventor-sources/:/home/developer/appinventor-sources \
  			$(TAG)-env
			
run:
	docker run --rm \
			--name appinventor-server-01 \
			-p 8888:8888 \
  			$(TAG)
