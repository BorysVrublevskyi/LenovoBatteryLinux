# Lenovo power management for Linux

Battery Management for Lenovo Ideapads (tested on Lenovo G570: Ubuntu 19.04, Fedora 31)

## Install acpi call kernel module

* Debian/Ubuntu: `sudo apt install acpi-call-dkms`

* Fedora : `sudo dnf install acpi_call`

* OpenSUEE: download and run (doubleclick) .yml file from here [The acpi-call kernel module](https://software.opensuse.org/package/acpi_call)

## Run script

`./battery_management.sh`

## Chose option in menu:

1. Enable battery protection mode (Charge level about 55~59%)

2. Disable battery protection mode (Charge level 100%)

3. Charge battery to 50% and exit


## Additional acpi-call parameters:

1 — Start battery calibration. Connect to power supply and call SBMC 1, after that the battery will fully charge, then it will completely discharge, then the calibration will end, and the battery will recharge.

0 — Stop battery calibration.

Sources: [1](https://www.linux.org.ru/forum/general/10574293?cid=11356142), [2](https://github.com/Sudokamikaze/LenovoBatteryLinux)
