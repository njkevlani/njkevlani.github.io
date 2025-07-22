---
title: "Tools"
---

# CLIs

- Lazygit - <https://github.com/jesseduffield/lazygit>
- Terminal-based markdown presenter <https://github.com/d0c-s4vage/lookatme>

# Databases

- DBeaver - <https://dbeaver.io>
- Bytebase - <https://www.bytebase.com>

# Utils

- Maccy - MacOS clipboard manager - <https://github.com/p0deje/Maccy>
- Multiple utils for generating aesthetic QR codes -
  <https://kylezhe.ng/posts/crafting_qr_codes>
  - <https://github.com/zhengkyl/qrframe>

# Webapps

- Diff between text - <https://diffdiff.net>
- Protobuf decoder - <https://protobuf-decoder.netlify.app>
- Visualise regex - <https://ihateregex.io/playground>

# Learning

- Diagram to understand github repositories -
  <https://github.com/ahmedkhaleel2004/gitdiagram>

# Cloud

## `gcloud` tricks & tips

Passing `--log-http` prints details about the http call being made underneath.

It helps in understanding exactly what is being done behind the scenes, which
can be helpful when replicating some of the `gcloud` functionality in some other
program.

For example,

```shell
gcloud --log-http compute regions list
```
