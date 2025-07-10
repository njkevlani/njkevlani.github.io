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
echo '0a 0a 08 c0 f7 be c3 06 10 d0 86 03 10 01 1a 06 68 65 6c 6c 6f 21' \
  | xxd -r -p \
  | protoc --decode_raw
```

Its output will look like this:

```text
1 {
  1: 1752153024
  2: 50000
}
2: 1
3: "hello!"
```

### With known type

Save `message.proto` with the following content:

```protobuf
syntax = "proto3";

import "google/protobuf/timestamp.proto";

message Message {
  enum State {
    UNKNOWN = 0;
    PENDING = 1;
    PROCESSED = 2;
    FAILED = 3;
  }

  google.protobuf.Timestamp receiveTime = 1;
  State state = 2;
  string content = 3;
}
```

```shell
echo '0a 0a 08 c0 f7 be c3 06 10 d0 86 03 10 01 1a 06 68 65 6c 6c 6f 21' \
  | xxd -r -p \
  | protoc --decode Message ./message.proto
```

Its output will look like this:

```text
receiveTime {
  seconds: 1752153024
  nanos: 50000
}
state: PENDING
content: "hello!"
```

## Encode protobuf bytes locally

With the same `message.proto` mentioned above, we can decode a message like this:

```shell
echo '
receiveTime {
  seconds: 1752153024
  nanos: 50000
}
state: 1
content: "hello!"
' | protoc --encode=Message ./message.proto | base64
```

Note: `base64` is used just to avoid binary junk being printed on terminal.
