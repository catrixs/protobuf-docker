# What is this

The smallest protobuffer image.

# How it works

This is tools to build protoc environment. It first compile protoc in ubuntu:14.04, then ```docker cp``` the protoc binary file to busybox container.

# Run

./build.sh build

Tested on DigitalOcean with CoreOS Droplet.
