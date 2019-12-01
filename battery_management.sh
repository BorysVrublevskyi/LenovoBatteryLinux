#!/bin/bash
clear
#debug:
#sudo modprobe -r acpi_call

if [ "x$(id -u)" != 'x0' ]; then
  echo 'Error: this script can only be executed by root'
  exit 1
fi

if [ -e /proc/acpi/call ] || sudo modprobe acpi_call ; then
  echo "Current charge level: $(cat /sys/class/power_supply/BAT1/capacity)%"  
  else echo "You need to install acpi_call kernel module"; exit 1
fi

function charger() {
case "$1" in
    "batProtect") echo '\_SB.PCI0.LPCB.EC0.VPC0.SBMC 4' > /proc/acpi/call ;;
    "batFull") echo '\_SB.PCI0.LPCB.EC0.VPC0.SBMC 5' > /proc/acpi/call ;;
    "batStartCalibrate") echo '\_SB.PCI0.LPCB.EC0.VPC0.SBMC 1' > /proc/acpi/call ;;
    "batStopCalibrate") echo '\_SB.PCI0.LPCB.EC0.VPC0.SBMC 0' > /proc/acpi/call ;;
    "SBMC2") echo '\_SB.PCI0.LPCB.EC0.VPC0.SBMC 2' > /proc/acpi/call ;;
    "SBMC3") echo '\_SB.PCI0.LPCB.EC0.VPC0.SBMC 3' > /proc/acpi/call ;;
esac
}

echo ==================================
echo "1. Enable \"Battery Protection Mode\" (Charge level about 50~70% depending of laptop model).
Select this when You working on AC power to protect battery from degradation."
echo "2. Enable \"Battery Fully Charged Mode\" (Charge level 100%).
Select this when You going to work from battery power."
echo "3. Start Battery Calibration. WARNING! This may damage your battery!
Laptop must be conected to the power supply!
Battery will fully charge, then it will completely discharge.
Then the calibration will end, and the battery will recharge."
echo "4. Stop Battery Calibration. WARNING! This may damage your battery!"
#echo "5. Call SBMC 2 - Unknown action"
#echo "6. Call SBMC 3 - Unknown action"
echo -n "Choose an action: "
read -r menu
case "$menu" in
    1) charger batProtect ;;
    2) charger batFull ;;
    3) charger batStartCalibrate ;;
    4) charger batStopCalibrate ;;
    #5) charger SBMC2 ;;
    #6) charger SBMC3 ;;
    *) echo "Error: \"$menu\" is invalid option"; exit 1 ;;
esac
sudo modprobe -r acpi_call