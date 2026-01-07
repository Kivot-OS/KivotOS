# KivotOS

> A minimal, highly customizable Debian-based operating system inspired by the aesthetics of Blue Archive.

<div align="center">

![KivotOS Logo](/kivotos.png)

[![Status](https://img.shields.io/badge/Status-Active-success?style=for-the-badge&logo=activity&logoColor=white)](https://github.com/Kivot-OS/KivotOS)
[![Architecture](https://img.shields.io/badge/Architecture-x86__64-ff6b6b?style=for-the-badge&logo=debian&logoColor=white)](#)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge&logo=opensourceinitiative&logoColor=white)](#)

</div>

KivotOS (formerly Blue Archive Linux) is designed for users who want a lightweight, optimized system that doesn't compromise on aesthetics. **Welcome to Kivotos, Sensei.**

This project offers a unique computing experience tailored for daily usage, development, and gaming. It is crafted with passion **by Senseis, for Senseis**, ensuring every boot feels like logging into Schale Residence.

## Built With

- **Base System:** [Debian](https://www.debian.org/)
- **Build Tools:** [Live-build](https://live-team.pages.debian.net/live-manual/), Docker, Bash
- **Desktop Environments:** XFCE, GNOME, KDE Plasma
- **Window Managers:** Openbox, Niri, Hyprland, AwesomeWM, i3

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

**3. Build Method B: Makefile (Dockerized)**

Ensure you have Docker installed and running. Please refer to the [official Docker documentation](https://docs.docker.com/get-docker/) for installation instructions specific to your OS.

```bash
# Once Docker is running:
make menuconfig
make
```

**4. Post-Install**

After installing KivotOS, you can install your preferred environment using standard APT:

```bash
# Example: updating and installing environment
sudo apt update
sudo apt install kivotos-kde-plasma
```

## Authors

👤 **Quang Minh**

- GitHub: [@minhmc2007](https://github.com/minhmc2007)
- Role: Creator (Retired/Archived)

👤 **Đinh Mạnh Dũng**

- GitHub: [@dungdinhmanh](https://github.com/dungdinhmanh)
- Role: **Current Lead Maintainer** & Co-Developer

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!
Feel free to check the [issues page](https://github.com/Kivot-OS/KivotOS/issues).

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

## Show your support

Give a ⭐️ if you like this project! It helps fund Arona's strawberry milk supply. 🍓🥛

## 💬 Community & Support

<div align="center">

**Get Help & Stay Connected**

[![GitHub Issues](https://img.shields.io/badge/GitHub-Issues-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Kivot-OS/KivotOS/issues)
[![Telegram](https://img.shields.io/badge/Telegram-Official%20Group-0088cc?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/blue_archive_linux)
[![Email](https://img.shields.io/badge/Email-Contact%20US-red?style=for-the-badge&logo=gmail&logoColor=white)](mailto:quangminh21072010@gmail.com)

**Join our official Telegram group:** [https://t.me/blue_archive_linux](https://t.me/blue_archive_linux)

</div>

## Acknowledgments

- **Nexon & Yostar** for creating the Blue Archive universe and our beloved students.
- **Arona & Plana** for (hopefully) keeping the system stable.
- **Debian Project** for the solid operating system foundation.
- **Microverse** for the README template inspiration.
- All the fellow Senseis, beta testers, and contributors who helped shape this project.

## 📝 License

This project is [MIT](https://github.com/Kivot-OS/KivotOS/blob/main/LICENSE) licensed.

**Why MIT?** We chose the MIT License because it is highly permissive. It allows anyone to use, modify, distribute, and sell copies of the software with very few restrictions. We want KivotOS to be as free and accessible as possible for the community.

---

<div align="center">

## 💙 Final Words

**To everyone who starred, forked, or just downloaded KivotOS — thank you.**

Even though @minhmc2007 has stepped back, the spirit of Kivotos lives on. With **@dungdinhmanh** taking the lead, we continue to build a system crafted with passion.

**— The KivotOS Team**

<br>

**Made with 💙 by Senseis, for Senseis**

_"A minimal system with maximum Blue Archive vibes"_

⭐ **Star us on GitHub** if you're excited about KivotOS!

</div>
