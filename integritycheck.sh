#!/bin/bash
# ******************************************************************************
# *                                                                            *
# *                      Polygen Grammars Integrity Check                      *
# *                                                                            *
# *                             by Tristano Ajmone                             *
# *                                                                            *
# ******************************************************************************
# "integritycheck.sh" v1.0.0 | 2018/01/17 | Pulic domain: http://unlicense.org
echo
# ==============================================================================
#                        Check that Polygen is available                        
# ==============================================================================
polygen 2>/dev/null
if [ $? -ne 0 ]
then
  echo "ERROR: This script requires Polygen to be on the system PATH."
  exit 1
fi
# ==============================================================================
#                           Test all Polygen grammars                           
# ==============================================================================
# Iterate through all *.grm files and report those grammars that didn't pass
# Polygen integrity test.
# ------------------------------------------------------------------------------
echo Now testing all Polygen grammars in this directory tree.
echo Only errors will be reported:
echo -----------------------------------------------------------------------------
declare -i cnt=0
declare -i bad=0
FILES=./**/*.grm
for f in $FILES
do
  polygen -t $f 1>/dev/null
    if [ $? -ne 0 ]
    then
    bad=$bad+1
    fi
  cnt=$cnt+1
done

echo -----------------------------------------------------------------------------
echo "Finished: $cnt grammars tested; $bad broken grammars found."
