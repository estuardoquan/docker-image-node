AUTHOR=dqio
IMAGE=node

TAG=${AUTHOR}/${IMAGE}

all: docker-build

docker-build: docker-build-node-setup \
	docker-build-node-main-latest \
	docker-build-node-main-vite \
	docker-build-node-main-websockets

docker-build-node-setup:
	docker build -t ${TAG}:setup --target setup ./

docker-build-node-main-latest:
	docker build -t ${TAG}:latest --target main ./

docker-build-node-main-vite:
	docker build -t ${TAG}:vite --target main --build-arg NODE_DIR=/var/www/html ./
	
docker-build-node-main-websockets:
	docker build -t ${TAG}:websockets --target main --build-arg NODE_DIR=/var/www/websockets ./
