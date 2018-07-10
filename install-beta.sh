#!/bin/bash

echo "[!!!] Installing beta version of Revisium Antivirus"

if [ ! -f "/opt/php71/lib/php/modules/ioncube_loader_lin_7.1.so" ] ;
then
  echo "Install php 7.1 with ioncube support"
  exit 1
fi

if [ -f "/usr/local/mgr5/sbin/mgrctl" ] ;
then
          echo "Start installation of beta..."

          line='zend_extension=/opt/php71/lib/php/modules/ioncube_loader'
          file=/opt/php71/etc/php.ini
          if ! grep -q "$line" "$file"; then
             echo "* Add ioncube extension in /opt/php71/etc/php.ini"
             echo "zend_extension=/opt/php71/lib/php/modules/ioncube_loader_lin_7.1.so" >> /opt/php71/etc/php.ini 
          fi

          cd /tmp && wget -O ra-for-ispmanlite-beta.zip https://raw.githubusercontent.com/ra-repos/isp/master/ra-for-ispmanlite-beta.zip && \
          unzip ra-for-ispmanlite-beta.zip -d ra-isp-package-0x0000-beta && cd ra-isp-package-0x0000-beta && chmod +x *.sh && \
          mkdir /usr/local/mgr5/addon/revisium_antivirus/common/ && cp -f ./install.sh /usr/local/mgr5/addon/revisium_antivirus/common/ && /usr/local/mgr5/addon/revisium_antivirus/common/install.sh && \
          find /tmp/ra-isp-package-0x0000-beta -delete && rm /tmp/ra-for-ispmanlite-beta.zip && rm /usr/local/mgr5/addon/revisium_antivirus/common/install.sh

else
          echo "ISPmanager Lite v5 not found"
fi

