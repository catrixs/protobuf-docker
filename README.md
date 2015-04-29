# What is this

The smallest protobuffer image. You could pull it from: ```docker pull chenfei/protobuf:2.4.1```.

This image has default CMD like this: ```protoc -I /protobuf/src --java_out=/protobuf/out /protobuf/src/*.proto```. So you run docker with volume like this: ```docker run --rm -it -v $YOUR_PROTO_FILE_PATH:/protobuf/src -v $YOUR_PROTO_OUT:/protobuf/out chenfei/protobuf:2.4.1```. Of Course you could override default CMD: ```docker run --rm -it -v $YOUR_PROTO_FILE_PATH:/protobuf/src -v $YOUR_PROTO_OUT:/protobuf/out chenfei/protobuf:2.4.1 sh```

# How it works

This is tools to build protoc environment. It first compile protoc in ubuntu:14.04, then ```docker cp``` the protoc binary file to busybox container.

# Build by yourself

./build.sh build

Tested on DigitalOcean with CoreOS Droplet.
