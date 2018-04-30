#!/bin/bash

if [ -f "/usr/local/mgr5/sbin/mgrctl" ]
then
          echo "Start installation"
          cd /tmp && wget -O ra-for-ispmanline.zip https://raw.githubusercontent.com/ra-repos/isp/master/ra-for-ispmanlite.zip && \
          unzip ra-for-ispmanline.zip -d ra-isp-package-0x0000 && cd ra-isp-package-0x0000 && chmod +x *.sh && ./install.sh && \
          cd .. && find ra-isp-package-0x0000 -delete && rm ra-for-ispmanline.zip

else
          echo "ISPmanager Lite v5 not found"
fi

