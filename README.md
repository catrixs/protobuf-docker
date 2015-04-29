# What is this

The smallest protobuffer image, just only 16M.

# How to use

Pull: ```docker pull chenfei/protobuf:2.4.1```.

CMD: ```protoc -I /protobuf/src --java_out=/protobuf/out /protobuf/src/*.proto```

RUN: ```docker run --rm -it -v $YOUR_PROTO_FILE_PATH:/protobuf/src -v $YOUR_PROTO_OUT:/protobuf/out chenfei/protobuf:2.4.1```

RUN: ```docker run --rm -it -v $YOUR_PROTO_FILE_PATH:/protobuf/src -v $YOUR_PROTO_OUT:/protobuf/out chenfei/protobuf:2.4.1 sh```

# How it works

This is tools to build protoc environment. It first compile protoc in ubuntu:14.04, then ```docker cp``` the protoc binary file to busybox container.

# Build by yourself

./build.sh build

Tested on DigitalOcean with CoreOS Droplet.
