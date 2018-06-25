#/bin/bash
set -e

setup_udev() {
  sudo cp udev/teensy.rules /etc/udev/rules.d/49-teensy.rules
  #Add user to dialout if they have not been
  sudo adduser $USER dialout

  #get rid of modemmanger, its always in the way
  sudo apt-get remove --purge modemmanger

  #reload udev
  udevnadm control --reload-rules && udevadm trigger
}

setup_udev
