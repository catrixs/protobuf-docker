#!/bin/sh

VERSION=$2

function compile {
    docker build -t chenfei/protobuild:${VERSION} -f Dockerfile.build.${VERSION} .
}

function build {
    compile \
    && cid=$(docker run -d --name chenfei_protobuild chenfei/protobuild:$VERSION) \
    && docker cp $cid:/usr/bin/protoc . \
    && docker cp $cid:/usr/lib/x86_64-linux-gnu/libstdc++.so.6 ./libstdc++ \
    && mv ./libstdc++/*.so* libstdc++.so.6 \
    && docker build -t chenfei/protobuf:$VERSION .

    docker rm $cid \
    || docker rmi chenfei/protobuild:$VERSION

}

function push {
        docker push chenfei/protobuf:$VERSION
}

case "$2" in
2.4.1)
    VERSION=$2
    ;;
2.5.0)
    VERSION=$2
    ;;
*)
    echo "build.sh build|compile|push version"
    exit 2
    ;;
esac

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
