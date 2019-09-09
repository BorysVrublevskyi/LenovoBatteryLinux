# Lenovo power management on Linux

Battery Management for Ideapads (tested on Lenovo G570 Ubuntu 19.04)

Install acpi call kernel module

`sudo apt install acpi-call-dkms`

Configure battery charge level (charge thresholds)

`./battery_management.sh`

Additional Parameters:

1 — Start battery calibration

0 — Stop battery calibration. You'll need to connect to power supply and call SBMC 1, after that the battery will fully charge, then it will completely discharge, then the calibration will end, and the battery will recharge.

Sources: [1](https://www.linux.org.ru/forum/general/10574293?cid=11356142), [2](https://github.com/Sudokamikaze/LenovoBatteryLinux)
