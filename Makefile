ifndef APP_NAME
	APP_NAME=$(shell basename `pwd`)
endif

.PHONY: build
build:
	@docker build --no-cache -t $(APP_NAME) -f Dockerfile .

.PHONY: ipython
ipython:
	@docker run -it --rm \
		--mount type=bind,src=$(PWD),dst=/usr/src/app \
		python-playground \
		ipython
