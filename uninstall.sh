#!/bin/bash

if [ -f "/usr/local/mgr5/sbin/mgrctl" ] ;
then
    echo "Start uninstallation"

    cd /tmp && wget -O ra-for-ispmanlite.zip https://files.imunify360.com/static/isp-imunifyav/v1/isp-imunifyav/uninstall.sh && \
    unzip ra-for-ispmanlite.zip -d ra-isp-package-0x0000 && cd ra-isp-package-0x0000 && chmod +x *.sh && ./uninstall.sh && \
    cd .. && find ra-isp-package-0x0000 -delete && rm ra-for-ispmanlite.zip

else
    echo "ISPmanager Lite v5 not found"
fi

