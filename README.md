# KivotOS

> A minimal, highly customizable Debian-based operating system inspired by the aesthetics of Blue Archive.

![KivotOS Logo](/kivotos.png)

KivotOS (formerly Blue Archive Linux) is designed for users who want a lightweight, optimized system that doesn't compromise on aesthetics. It offers a unique computing experience tailored for daily usage, development, and gaming, built by Senseis, for Senseis.

## Built With

- **Base System:** [Debian](https://www.debian.org/)
- **Build Tools:** [Live-build](https://live-team.pages.debian.net/live-manual/), Docker, Bash
- **Package Manager:** `bluepm` (Custom Python/Bash implementation)
- **Desktop Environments:** XFCE, GNOME, KDE Plasma

## Getting Started

To get a local copy up and running or to build your own ISO, follow these simple steps.

### Prerequisites

- Docker (for containerized builds)
- `live-build` (for native builds)
- A 64-bit x86_64 system

### Installation

**1. Clone the repository**

```bash
git clone https://github.com/Kivot-OS/KivotOS.git
cd KivotOS
```

**2. Build Method A: Shell Script**

```bash
sudo bash build.sh
```

**3. Build Method B: Makefile**

```bash
sudo apt install docker.io
sudo systemctl start docker
make menuconfig
make
```

**4. Post-Install**

After installing KivotOS on your machine, use `bluepm` to set up your environment:

```bash
bluepm update-cache
bluepm install bal-kde-plasma
```

## Authors

👤 **Quang Minh**

- GitHub: [@minhmc2007](https://github.com/minhmc2007)
- Role: Creator & Lead Developer

👤 **Dung Dinh Manh**

- GitHub: [@dungdinhmanh](https://github.com/dungdinhmanh)
- Role: Co-Developer

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!
Feel free to check the [issues page](https://github.com/Kivot-OS/KivotOS/issues).

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- **Nexon & Yostar** for creating the Blue Archive universe.
- **Debian Project** for the solid operating system foundation.
- **Microverse** for the README template inspiration.
- All the beta testers and contributors who helped shape this project.

## 📝 License

This project is [GPL-3.0](https://github.com/Kivot-OS/KivotOS/blob/main/LICENSE) licensed.
