# Lenovo power management for Linux

Battery Management for Lenovo Ideapads (tested on Lenovo G570: Ubuntu 19.04, Fedora 31)

## Install acpi_call kernel module

* Debian/Ubuntu: `sudo apt install acpi-call-dkms`

* Fedora:

    ```
    sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
    sudo dnf install http://repo.linrunner.de/fedora/tlp/repos/releases/tlp-release.fc$(rpm -E %fedora).noarch.rpm
    sudo dnf install acpi_call
    ```

* OpenSUEE: download and run (doubleclick) .yml file from: [the acpi-call kernel module page](https://software.opensuse.org/package/acpi_call)

## Using

download this script:

`wget https://github.com/BorysVrublevskyi/LenovoPowerManagementLinux/raw/master/battery_management.sh`

Allow system to run it:

`chown +x battery_management.sh`

Run it:

`sudo ./battery_management.sh`

Avalaible options:

1. Enable "Battery Protection Mode" (Charge level about 50~70% depending of laptop model).
Select this when You working on AC power to protect battery from degradation.

2. Enable "Battery Fully Charged Mode" (Charge level 100%).
Select this when You going to work from battery power.

3. Start Battery Calibration. WARNING! This may damage your battery!
Laptop must be conected to the power supply!
Battery will fully charge, then it will completely discharge.
Then the calibration will end, and the battery will recharge.

4. Stop Battery Calibration. WARNING! This may damage your battery!

## Disclaimer

Read the menu items carefully. You are solely responsible for the results of your actions.

Sources: [1](https://www.linux.org.ru/forum/general/10574293?cid=11356142), [2](https://github.com/Sudokamikaze/LenovoBatteryLinux)