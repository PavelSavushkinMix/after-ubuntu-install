# After Ubuntu Install

> Applications installer

The scripts allows you to install applications after fresh installation of Debian-based system (tested on Ubuntu 16.04).

### Usage

1. Create a configuration file:
```bash
cp .env.example .env
```
2. Update a configuration variable with necessary packages: **PACKAGES_TO_INSTALL**
3. (Optional) Update ./packages/own/install.sh file with your own configurations, e.g. updating fstab.

### How it works
You should start a script with root privileges because of packaging tool work.
The installation sctipt validates environment variables, updates the repositories and install the packages.

If you need some repositories, just create a *repo.sh* file in a root of package folder. The file could contain management of /etc/apt/source.list[.d/*] file(s) and/or install required lib(s).
