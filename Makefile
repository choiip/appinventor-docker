default: build_prod

source:
	git clone --recursive https://github.com/mit-cml/appinventor-sources.git

TAG = appinventor-server
build_env:
	docker build --rm -t $(TAG)-env -f Dockerfile .

build_prod:
	docker build --rm -t $(TAG) -f prod.Dockerfile .

dev:
	docker run --rm -it --privileged \
			-p 8888:8888 \
  			-p 5037:5037 \
  			-v /dev/bus/usb:/dev/bus/usb \
  			-v ${PWD}/appinventor-sources/:/home/developer/appinventor-sources \
  			$(TAG)-env
			
run:
	docker run --rm --privileged \
			--name appinventor-server-01 \
			-p 8888:8888 \
  			-p 5037:5037 \
  			$(TAG)