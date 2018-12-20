# cfgs

# Linux Packages
```
# packages for secure card
sudo apt-get install opensc pcsc-tools

# python stuff
sudo apt-get install python3 python3-pip python3-venv python3-dev
```

# Windows Remote Desktop
- client: Remina

## config
```
[Basic]
Server: 10.131.51.80
UserName: U80850403
PW: <windows password>
Domain: ADB

[Advanced]
Sound: Remote
Security: TLS
Options: [x] Share smartcard, [ ] share local printers, [ ] disable clipboard sync, [ ] attach to console

[ssh]
[ ] enable ssh tunnel
```


# Access Services
## wmts
curl -H "Referer: https://ltboc.geo.admin.ch" -I "https://wmts.geo.admin.ch/1.0.0/ch.swisstopo.pixelkarte-farbe/default/current/2056/20/98/74.jpeg"

# Smartcard
## packages for secure card
sudo apt-get install opensc pcsc-tools

## increase debug level:
sudo vim /etc/opensc/opensc.conf

## restart services
sudo systemctl restart pcscd.socket
sudo systemctl restart pcscd.service

## list available readers
opensc-tool -l


# Networks
from internal network: git.lt.admin.ch:10022 -> git.bgdi.ch:10022
