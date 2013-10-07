#!/bin/bash

# 6 Server

pulp-admin rpm repo create --publish-http=true --relative-url=/content/dist/rhel/server/6/6.4/x86_64/kickstart  --feed=http://cdn.rcm-test.redhat.com/content/dist/rhel/server/6/6.4/x86_64/kickstart/ --repo-id=rhel64-ks-x86_64
pulp-admin rpm repo create --publish-http=true --relative-url=/content/dist/rhel/server/6/6.4/x86_64/os  --feed=http://cdn.rcm-test.redhat.com/content/dist/rhel/server/6/6.4/x86_64/os/ --repo-id=rhel64-os-x86_64
pulp-admin rpm repo create --publish-http=true --relative-url=content/dist/rhel/server/6/6Server/x86_64/os/  --feed=http://cdn.rcm-test.redhat.com/content/dist/rhel/server/6/6Server/x86_64/os/ --repo-id=rhel6Server-os-x86_64


pulp-admin rpm repo create --publish-http=true --relative-url=/content/dist/rhel/server/6/6.4/i386/kickstart  --feed=http://cdn.rcm-test.redhat.com/content/dist/rhel/server/6/6.4/i386/kickstart --repo-id=rhel64-ks-i386
pulp-admin rpm repo create --publish-http=true --relative-url=/content/dist/rhel/server/6/6.4/i386/os  --feed=http://cdn.rcm-test.redhat.com/content/dist/rhel/server/6/6.4/i386/os/ --repo-id=rhel64-os-i386
pulp-admin rpm repo create --publish-http=true --relative-url=content/dist/rhel/server/6/6Server/i386/os/  --feed=http://cdn.rcm-test.redhat.com/content/dist/rhel/server/6/6Server/i386/os/ --repo-id=rhel6Server-os-i386

# 5 Server
pulp-admin rpm repo create --publish-http=true --relative-url=/content/dist/rhel/server/5/5.9/x86_64/kickstart  --feed=http://cdn.rcm-test.redhat.com/content/dist/rhel/server/5/5.9/x86_64/kickstart/ --repo-id=rhel59-ks-x86_64
pulp-admin rpm repo create --publish-http=true --relative-url=/content/dist/rhel/server/5/5Server/x86_64/os  --feed=http://cdn.rcm-test.redhat.com/content/dist/rhel/server/5/5Server/x86_64/os/ --repo-id=rhel5Server-os-x86_64
