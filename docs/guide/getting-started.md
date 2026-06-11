# Getting Started

KivotOS (formerly Blue Archive Linux) is a minimal, highly customizable Debian-based operating system inspired by the aesthetics of *Blue Archive*.

## Prerequisites

- A 64-bit (x86_64) system
- At least 10 GB free disk space for building

## Quick Install (ISO)

1. Download the latest ISO from the [releases page](https://github.com/Kivot-OS/KivotOS/releases/latest)
2. Flash to a USB drive:

   ```bash
   sudo dd if=KivotOS-*.iso of=/dev/sdX bs=4M status=progress
   ```

3. Boot from the USB and follow the installer

## Quick Build (Native)

If you're on Debian 13+ and want to build from source:

```bash
git clone https://github.com/Kivot-OS/KivotOS.git
cd KivotOS
sudo apt update && sudo apt install live-build git
make build
```

The ISO will be at `builds/KivotOS-YYYY-MM-DD-amd64.hybrid.iso`.

## Next Steps

- Read the [Build Guide](/guide/build-guide) for all build methods
- Join our [Telegram group](https://t.me/blue_archive_linux)
- Star us on [GitHub](https://github.com/Kivot-OS/KivotOS)
