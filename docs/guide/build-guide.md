# Building KivotOS

This guide covers all methods for building a KivotOS ISO from source.

## Prerequisites

| Tool | Required for | Install |
|------|-------------|---------|
| `live-build` | Native build | `sudo apt install live-build` |
| `git` | Cloning the repo | `sudo apt install git` |
| Docker | Docker build | [docker.com](https://docs.docker.com/get-docker/) |
| `systemd-nspawn` | nspawn build | `sudo apt install systemd-container` |

**Disk space:** At least 10 GB free. The build process downloads packages and builds a squashfs image.

**Architecture:** Only `amd64` (x86_64) is currently supported.

## Quick Start (Native Build)

```bash
# Clone the repository
git clone https://github.com/Kivot-OS/KivotOS.git
cd KivotOS

# Install build dependencies (Debian 13+)
sudo apt update
sudo apt install live-build git

# Build the ISO
make build
```

When complete, the ISO will be at `builds/KivotOS-YYYY-MM-DD-amd64.hybrid.iso`.

## Build Methods

### Method 1: Native (`make build`)

This runs live-build directly on your host system. It must be run on a Debian-based system (Debian 13 "trixie" or later recommended).

The build process:
1. **Clean** — removes any previous build artifacts (`lb clean --purge`)
2. **Configure** — applies settings from `kivotos/auto/config`
3. **Build** — downloads packages and creates the live ISO (`lb build`)
4. **Output** — moves the ISO to `builds/` with a date-stamped filename

The build configuration lives in `kivotos/auto/config`. This is the single source of truth for:
- Debian release (currently: trixie)
- Package repositories (main, contrib, non-free, non-free-firmware)
- Desktop environments and packages
- Bootloader settings (GRUB BIOS + EFI)
- System hostname and default user

### Method 2: Docker (`make docker-build`)

Builds inside an isolated Docker container. This method requires a Dockerfile in the repository root. See [Issue #TODO](https://github.com/Kivot-OS/KivotOS) for progress on this.

### Method 3: nspawn Container (`make nspawn-build`)

Builds inside a Debian systemd-nspawn container. This is the recommended approach when your host is not Debian-based (e.g., Arch Linux, Fedora).

```bash
# Set up a Debian 13 container
sudo debootstrap trixie /var/lib/machines/kivotos-build

# Start the container
sudo systemd-nspawn -D /var/lib/machines/kivotos-build

# Inside the container:
apt update
apt install live-build git
git clone https://github.com/Kivot-OS/KivotOS.git
cd KivotOS
make build
exit

# The ISO will be at /var/lib/machines/kivotos-build/KivotOS/builds/
```

## Customizing the Build

### Changing packages

Edit the files in `kivotos/config/package-lists/`. Each line is a package name:

```
# Example: add a package
my-package
```

### Changing the base distribution

Edit `kivotos/auto/config` and change `--distribution`:

```bash
--distribution trixie
```

Available options: `stable`, `testing`, `unstable`, or a specific release name.

### Changing the ISO name

Edit `kivotos/auto/config` and change `--image-name`:

```bash
--image-name "KivotOS"
```

## Troubleshooting

### `lb: command not found`

Install live-build: `sudo apt install live-build`

### Build fails with "No space left on device"

The build directory (`kivotos/.build/`) can grow large. Run `make clean` and free up disk space.

### Build fails with network errors

Ensure you have a stable internet connection. The build downloads packages from Debian mirrors. If a mirror is slow, change `--mirror-bootstrap` in `kivotos/auto/config`.

### Permission denied

live-build requires root privileges. The Makefile uses `sudo` internally. If you encounter permission issues, ensure you have sudo access.

### ISO not found after build

Check `builds/` directory. If the build succeeded but no ISO is there, run `ls kivotos/` to see if the ISO stayed in the build directory, then manually move it.

## CI/CD

The GitHub Actions workflow (`.github/workflows/disabled/beta.yml`) automates builds on push and pull request. To enable it:

1. Update the ISO pattern in the workflow to match `KivotOS-*.iso`
2. Move the file out of `disabled/` directory
3. Commit and push

The CI workflow currently builds inside Docker and expects `make build` to produce an ISO.
