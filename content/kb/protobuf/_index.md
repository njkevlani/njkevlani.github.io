---
title: "Protobuf"
date: 2024-10-06T03:32:22+05:30
tags: []
---
# Distribute protobuf files

A general idea is to distribute `.proto` files via a git repo and managing releases
from this central place.

What this does is:
- Put all release related tooling at single place.
- Version control `.proto` files.
- Provide a review process on contracts.

References are:
- https://medium.com/namely-labs/how-we-build-grpc-services-at-namely-52a3ae9e7c35
- https://stackoverflow.com/a/62128550/6645446

# Useful tools
- Online Protobuf Decoder - https://protobuf-decoder.netlify.app/

# Tips and tricks

## Decode protobuf bytes locally


### With unknown type
```shell
echo '22 05 68 65 6c 6c 6f' \
  | xxd -r -p \
  | protoc --decode_raw

4: "hello"
```

### With known type

Content of `test.proto`

```protobuf
message Test {
  optional string s = 4;
}
```

```shell
echo '22 05 68 65 6c 6c 6f' \
  | xxd -r -p \
  | protoc --decode Test ./test.proto

s: "hello"
```
