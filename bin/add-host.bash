#!/bin/bash

usage() {
cat <<EOF
Usage: $0 <puppet server>
EOF
exit 1
}

die() { echo "$@" 1>&2; exit 1; }

[ ! -z $1 ] || usage
[ ! -z $(hostname -f) ] || (echo "hostname -f does not return a valid hostname" && usage)


PUPPET_SERVER=$1

echo "Installing puppet..."
rpm -q puppet || yum -y install puppet



cat <<EOF > puppet.conf
[main]
vardir = /var/lib/puppet
logdir = /var/log/puppet
rundir = /var/run/puppet
ssldir = \$vardir/ssl

[agent]
pluginsync      = true
report          = true
ignoreschedules = true
daemon          = false
ca_server       = $PUPPET_SERVER
certname        = $(hostname -f)
server          = $PUPPET_SERVER
EOF

