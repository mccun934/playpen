#!/bin/bash

ssh root@koji.katello.org "/usr/local/bin/katello-mash-split-1.4.py"
ssh fedorapeople.org 'cd /project/katello/bin && sh download-repos-from-koji'


