.PHONY: build
build:
	docker build -t node-dev:10.16.0-stretch -f Dockerfile .

.PHONY: run
run:
	docker run -d -p 3000:3000 --rm --name node-dev node-dev:10.16.0-stretch || :

.PHONY: push
push:
	docker tag node-dev:10.16.0-stretch yongs2/node-dev:10.16.0-stretch
	docker push yongs2/node-dev:10.16.0-stretch

.PHONY: exec
exec:
	docker exec -it node-dev /bin/bash

.PHONY: stop
stop:
	docker stop node-dev || :

.PHONY: logs
logs:
	docker logs -f node-dev || :
