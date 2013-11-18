#!/usr/bin/python

import commands

# print commands.getstatusoutput('wc -l file')

def check_rpm_list(rpm_array, search_strings):
  conflict_count = 0
  for rpm in rpm_array:
    for s in search_strings:
      if rpm.find(s) >= 0:
        print "  Conflicting package found, recommend removing: %s" % rpm
        conflict_count += 1

  if conflict_count > 0:
    print "\nCONFLICT DETECTED: Found [%s] conflicting packages, recommend removal." % conflict_count
  else:
    print "OK: No conflicting packages detected"


def check_registration():
  output = "subscription-manager identity"
  retcode = output[0]
  if retcode != 0:
    print "CONFLICT DETECTED: Your system is not registered via subscription-manager"
    print "and may not have access to required packages to complete installation."
    print "Recommend using the 'subscription-manager' command to properly register your system"
  else:
    print "OK: Registered via subscription-manager"


def check_packages():
  output = commands.getstatusoutput('rpm -qa')
  javarpms = output[1].strip().split('\n')
  check_rpm_list(javarpms, ['oracle', 'sun', 'ibm', 'puppet', 'katello', 'pulp'])

def check_puppet():
  print "Check puppet"


def check_repos():
  print "Check repos"
  output = commands.getstatusoutput("yum -v repolist enabled | grep \"Repo-id\"")
  repo_ids = output[1]
  # Check for rhel6-server
  if not "rhel-6-server-rpms" in repo_ids:
    print "WARNING: rhel-6-server-rpms is not an enabled yum repository.  Your system needs"
    print "access to Red Hat Enterprise Linux 6 RPMs.  Proceed with caution"

  if not "rhel-server-6-satellite-6-mdp-2-rpms" in repo_ids:
    print "WARNING: rhel-server-6-satellite-6-mdp-2-rpms is not an enabled yum repository.  Your"
    print "system needs access  

  rhel-server-6-satellite-6-mdp-2-rpms
  for id in repo_ids:
    if id.find('rhel-6-server-rpms') >= 0 


print "\n1) Checking installed packages for possible conflicts\n"
check_packages()
print "\n2) Checking system registration via subscription-manager\n"
check_registration()
print "\n3) Checking configured yum repositories\n"
check_repos()

