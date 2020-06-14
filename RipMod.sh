#!/bin/bash
# Author: Khalu
# based on instructions from https://blog.dfir.fi/tools/2020/02/19/install-regripper.html
echo "RegRipper2.8 Linux install helper script"
if [ -f rip.pl ];
then
  echo "found rip.pl, making changes"
  tail -n +2 rip.pl > rip
  perl -pi -e 'tr[\r][]d' rip
  sed -i "1i #\!$(which perl)" rip
  sed -i 's/\#my\ \$plugindir/\my\ \$plugindir/g' rip
  sed -i 's/\#push/push/' rip
  sed -i 's/\"plugins\/\"\;/\"\/usr\/share\/regripper\/plugins\/\"\;/' rip
  sed -i 's/(\"plugins\")\;/(\"\/usr\/share\/regripper\/plugins\")\;/' rip
  sudo mkdir -p /usr/share/regripper/
  sudo cp -r plugins/ /usr/share/regripper/
  sudo mv rip /usr/local/bin/rip.pl
  chmod +x /usr/local/bin/rip.pl
  echo "Finished"
  echo "now run \"source ~/.bashrc\""
else
  echo "Move this script into the RegRipper directory and run again"
  exit 1
fi
