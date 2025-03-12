xrdp-genkeymap km-0419.ini
sudo mv km-0419.ini /etc/xrdp
sudo chown root:root /etc/xrdp/km-0419.ini
sudo systemctl restart xrdp xrdp-sesman
