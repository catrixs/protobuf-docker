#



compile:
	docker build -t chenfei/protobuild -f Dockerfile.build .

build: compile
	cid=$(docker run -d --name chenfei/protobuild chenfei/protobuild)
	docker cp $cid:/usr/bin/protoc .
	docker build -t chenfei/protobuf:2.4.1 .
	docker rm chenfei/protobuild
	docker rmi chenfei/protobuild

push: build
	docker push chenfei/protobuf:2.4.1

