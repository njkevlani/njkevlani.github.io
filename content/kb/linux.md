---
title: "Linux"
---

# Setting up

## Enabling `ssh-agent`

```shell
systemctl --user enable ssh-agent.service
```

## Essential packages

- `xclip` & `xsel` - for system clipboard integration in `neovim`
- `git`
- `neovim`
- `stow` - for configuration management
- `networkmanager` & `nm-applet` for network configuration
  - Need to do `sudo systemctl enable --now NetworkManager.service`
- `blueman` for bluetooth setup
  - Need to do `sudo systemctl enable --now bluetooth.service`
- `pipewire` for sound setup,
  - Need to do `systemctl --user enable --now pipewire.service`
- `pass` & `pass-otp` for password management
- `ttf-roboto-mono`, `noto-fonts` & `noto-fonts-emoji` for supporting larger
  range of fonts.
