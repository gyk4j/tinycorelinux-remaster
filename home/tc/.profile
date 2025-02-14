#!/bin/sh

##############################################################################
#                            License & Copyright                             #
#                                                                            #
# The materials herein are from "Into the Core: A look at Tiny Core Linux"   #
# (http://www.tinycorelinux.net/book.html) by Lauri Kasanen et al. The book  #
# is licensed under the CC BY-NC-SA 4.0 license (http://creativecommons.org/ #
# licenses/by-nc-sa/4.0/). (C) 2013 Lauri Kasanen.                           #
##############################################################################

# Include the helper functions
. /etc/init.d/tc-functions

# checkbootparam checks for the presence
# getbootparam gets the argument from "param=arg"

# If the boot code "stress" is present, the script checks another boot
# code, "stresstype=foo", for which type of stress test to run.

if $(checkbootparam stress); then
  type=$(getbootparam stresstype)
  
  case $type in
    cpu)
      # CPU testing here
    ;;
    ram)
      # RAM testing
    ;;
    *)
      echo Unknown test $type
      sleep 20
    ;;
  esac
fi
