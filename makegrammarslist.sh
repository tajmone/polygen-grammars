#!/bin/bash
# ******************************************************************************
# *                                                                            *
# *                    polygen Grammars Info-List Generator                    *
# *                                                                            *
# *                             by Tristano Ajmone                             *
# *                                                                            *
# ******************************************************************************
# "makelist.sh" v1.0.0 | 2018/02/01 | Pulic domain: http://unlicense.org
# ------------------------------------------------------------------------------
# Extract info from all non-gitignored Polygen grammars and create a GFM file
# with the full list of grammars and their descriptions ("GRAMMARS_LIST.md")
# ------------------------------------------------------------------------------
# This script was written for Bash for Windows: EOLs are converted to CRLF.
# In order to use it under Linux or Mac, you'll have to fix End-of-Lines from
# CRLF to LF in the generated markdown file before commiting.
# ------------------------------------------------------------------------------
# Requirements:
# -- recode for Windows. Download the following archive:
#    http://www.wzw.tum.de/public-html/syring/win32/UnxUtils.zip
#    and extract "usr\local\wbin\recode.exe" here or to some folder in your PATH.
# -- eol-converter-cli (Node.js):
#    https://www.npmjs.com/package/eol-converter-cli
# ------------------------------------------------------------------------------

echo
OUTFILE=GRAMMARS_LIST.md
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
#                                DEFINE FUNCTIONS                               
# ==============================================================================
scanFolder () {
  FILES=./$1/*.grm
  for f in $FILES
  do
    # Check if grammar is being Git-ignored:
    git check-ignore -q $f
    if [ $? -ne 0 ]
    then
      # Grammar not ignored, proceed...
      echo + Processing grammar: $f
      GrmInfo=$(polygen -info $f | recode html/CR..utf-8/CR-LF)
      if [ $? -ne 0 ]
      then
        echo "error"
        exit 1
      else
        echo -e "### $f\n\n~~~" >> $OUTFILE
        echo -e $GrmInfo >> $OUTFILE
        echo -e "~~~\n\n" >> $OUTFILE
      fi
    else
      # Skip Git-ignored grammars (ie: blacklisted grammars)
      echo - Skipping Git-ignored grammar: $f
    fi
  done  
}
# ==============================================================================
#                            Process Polygen Grammars                           
# ==============================================================================
# Process all non-gitignored grammars, one lang folder at the time, and print
# results to markdown file.
# ------------------------------------------------------------------------------
echo -e "# Grammars List" > $OUTFILE

echo Scanning Italian grammars
echo -----------------------------------------------------------------------------
echo -e "\n## Italian Grammars\n" >> $OUTFILE
scanFolder it
echo -----------------------------------------------------------------------------
echo Scanning English grammars
echo -----------------------------------------------------------------------------
echo -e "\n## English Grammars\n" >> $OUTFILE
scanFolder en
echo -----------------------------------------------------------------------------
echo Scanning French grammars
echo -----------------------------------------------------------------------------
echo -e "\n## French Grammars\n" >> $OUTFILE
scanFolder fr
echo -----------------------------------------------------------------------------
echo Fixing EOLs to CRLF in $OUTFILE
eolConverter crlf $OUTFILE 1>/dev/null
echo -----------------------------------------------------------------------------
echo Finished
exit
