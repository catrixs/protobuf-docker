FROM progrium/busybox 

ADD protoc /usr/bin/protoc
ADD libstdc++.so.6 /lib/libstdc++.so.6

CMD ["protoc -I /protobuf/src --java_out=/protobuf/out /protobuf/src/*.proto"]
