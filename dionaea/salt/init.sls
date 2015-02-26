dionaea-ppa:
  pkgrepo.managed:
    - ppa: honeynet/nightly

dionaea:
  pkg.installed:
    - pkgs:
      - dionaea

/var/dionaea:
  file.directory:
    - user: nobody
    - group: nogroup

/var/dionaea/wwwroot:
  file.directory:
    - user: nobody
    - group: nogroup

/var/dionaea/binaries:
  file.directory:
    - user: nobody
    - group: nogroup

/var/dionaea/log:
  file.directory:
    - user: nobody
    - group: nogroup

sudo mv /etc/dionaea/dionaea.conf.dist /etc/dionaea/dionaea.conf:
  cmd:
    - run

sudo sed -i 's/var\/dionaea\///g' /etc/dionaea/dionaea.conf:
  cmd:
    - run

sudo sed -i 's/log\//\/var\/dionaea\/log\//g' /etc/dionaea/dionaea.conf:
  cmd:
    - run

sudo dionaea -c /etc/dionaea/dionaea.conf -w /var/dionaea -u nobody -g nogroup -D:
  cmd:
    - run