#!/bin/bash

################################################################################
# I3-GAPS INSTALL SCRIPT
# CREATED 2021-07-19
################################################################################

# install dependencies
sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
libstartup-notification0-dev libxcb-randr0-dev \
libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev

# make temp folder
cd ~
[ -d "i3_gaps_temp" ] && rmdir -r i3_gaps_temp
mkdir i3_gaps_temp && cd i3_gaps_temp

# clone repo
git clone https://www.github.com/Airblader/i3 i3_gaps
cd i3_gaps

# compile
mkdir -p build && cd build
meson ..
ninja
sudo ninja install

# clean up
cd ~
rm -r i3_gaps_temp
