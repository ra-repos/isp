#!/bin/bash

if [ -f "/usr/local/mgr5/sbin/mgrctl" ] && [ -d "/usr/local/mgr5/addon/revisium_antivirus" ] ;
then
          echo "Start uninstallation"
          cd /tmp && wget -O ra-for-ispmanlite.zip https://raw.githubusercontent.com/ra-repos/isp/master/ra-for-ispmanlite.zip && \
          unzip ra-for-ispmanlite.zip -d ra-isp-package-0x0000 && cd ra-isp-package-0x0000 && chmod +x *.sh && ./uninstall.sh && \
          cd .. && find ra-isp-package-0x0000 -delete && rm ra-for-ispmanlite.zip

else
          echo "ISPmanager Lite v5 or Revisium Antivirus for ISPmanager not found"
fi

