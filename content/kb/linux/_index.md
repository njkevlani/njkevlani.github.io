---
title: "Linux"
date: 2025-01-17T11:18:10+05:30
tags: []
---

# Setting up

## Enabling `ssh-agent`

```
systemctl --user enable ssh-agent.service
```

## Essential packages

- `xclip` & `xsel` - for system cilpboard integreation in `neovim`
- `git`
- `neovim`
- `stow` - for configuration management
- `networkmanager` & `nm-applet` for network configuration
  - Need to do `sudo systemctl enable --now NetworkManager.service`
- `blueman` for bluetooh setup
  - Need to do `sudo systemctl enable --now bluetooth.service`
- `pipewire` for sound setup,
  - Need to do `systemctl --user enable --now pipewire.service`
- `pass` & `pass-otp` for password management
- `ttf-roboto-mono`, `noto-fonts` & `noto-fonts-emoji` for supporing larger range of fonts.
