AUTHOR=dqio
IMAGE=node

TAG=${AUTHOR}/${IMAGE}

all:

docker-build: docker-build-node docker-build-node-vite docker-build-node-websockets

docker-build-node:
	docker build -t ${TAG}:latest ./

docker-build-node-vite:
	docker build -t ${TAG}:vite --build-arg NODE_DIR=/var/www/html ./
	
docker-build-node-websockets:
	docker build -t ${TAG}:websockets --build-arg NODE_DIR=/var/www/websockets ./
