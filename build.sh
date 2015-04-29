#!/bin/bash

VERSION=2.4.1

function compile {
	docker build -t chenfei/protobuild:$VERSION -f Dockerfile.build .
}

function build {
	compile \
	&& cid=$(docker run -d --name chenfei_protobuild chenfei/protobuild:$VERSION) \
 	&& docker cp $cid:/usr/bin/protoc . \
	&& docker cp $cid:/usr/lib/x86_64-linux-gnu/libstdc++.so.6 ./libstdc++ \
	&& mv ./libstdc++/*.so* libstdc++.so.6 \
 	&& docker build -t chenfei/protobuf:$VERSION . 

	docker rm chenfei_protobuild \
	|| docker rmi chenfei/protobuild:$VERSION

}

function push {
	docker push chenfei/protobuf:2.4.1
}

case "$1" in
build)
	build
	;;
compile)
	compile
	;;
*)
	echo "build.sh build|compile|push"
	;;
esac
