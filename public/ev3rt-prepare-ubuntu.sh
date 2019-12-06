#!/bin/bash

#
# Compiler version information
#
GCC_ARM_VER="6-2017-q1-update"
GCC_ARM_URL="https://developer.arm.com/-/media/Files/downloads/gnu-rm/6_1-2017q1/gcc-arm-none-eabi-6-2017-q1-update-linux.tar.bz2"
GCC_ARM_DIR="/opt"

# Stop on error
set -e

# Check root
if [[ "$EUID" -ne 0 ]]; then
    echo Must be run as root.
    exit -1
fi

# Prepare temp directory
WORK_DIR=`mktemp -d`
#cp `basename ${GCC_ARM_URL}` ${WORK_DIR}
function cleanup {
    rm -rf ${WORK_DIR}
}
trap cleanup EXIT

#
# Print some information
#
cat << EOF
Prepare necessary environment for EV3RT on Ubuntu Linux.

This script will:
1. Remove binutils-arm-none-eabi and gcc-arm-none-eabi packages if installed.
2. Install u-boot-tools and lib32stdc++6 packages when not installed.
3. Install GNU Arm Embedded Toolchain (version: ${GCC_ARM_VER}) under ${GCC_ARM_DIR}.

Please select:
EOF
select yn in "Start to install" "Exit"; do
    case $REPLY in
    1 ) break;;
    2 ) exit -1;;
    esac
done

#
# Start to install
#

echo -e "\nRemove binutils-arm-none-eabi and gcc-arm-none-eabi:"
apt-get remove binutils-arm-none-eabi gcc-arm-none-eabi -y

echo -e "\nInstall u-boot-tools and lib32stdc++6:"
apt-get install u-boot-tools lib32stdc++6 -y

echo -e "\nInstall GNU Arm Embedded Toolchain:"
cd ${WORK_DIR}
wget "${GCC_ARM_URL}"
tar -xvvf `basename ${GCC_ARM_URL}` -C ${GCC_ARM_DIR}
echo export PATH=\$PATH:${GCC_ARM_DIR}/gcc-arm-none-eabi-${GCC_ARM_VER}/bin > /etc/profile.d/ev3rt.sh

echo Done. Please reboot or logout.

