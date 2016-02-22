#!/bin/bash

# This is required to make systemd shutdown SSH connections before
# halting the VM; otherwise 'vagrant halt' just hangs.
#
# See:
# https://github.com/mitchellh/vagrant/pull/6315
# https://github.com/mitchellh/vagrant/issues/5497
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=751636
systemctl disable ssh.service
systemctl enable ssh.socket
