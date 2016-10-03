#!/bin/sh
# script for execution of deployed applications
#
# Sets up the MATLAB runtime environment for the current $ARCH and executes 
# the specified command.
#
exe_name=$0
exe_dir=`dirname "$0"`

# Make sure that the .e (error) and .o (output) file arrive in the
# working directory
#$ -cwd

#Merge the standard out and standard error to one file
#$ -j y

#Show error message if job is not able to run with existing ressource configuration
#$ -w e

#   Set mail address and send a mail on job's start, end and abort
#$ -M thanujaa@student.ethz.ch
#$ -m bea

source /home/sgeadmin/ITETCELL/common/settings.sh

echo "------------------------------------------"
if [ "x$1" = "x" ]; then
  echo Usage:
  echo    $0 \<deployedMCRroot\> args
else
  echo Setting up environment variables
  MCRROOT="$1"
  echo ---
  LD_LIBRARY_PATH=.:${MCRROOT}/runtime/glnxa64 ;
  LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${MCRROOT}/bin/glnxa64 ;
  LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${MCRROOT}/sys/os/glnxa64;
  LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${MCRROOT}/sys/opengl/lib/glnxa64;
  export LD_LIBRARY_PATH;
  echo LD_LIBRARY_PATH is ${LD_LIBRARY_PATH};
  shift 1
  args=
  while [ $# -gt 0 ]; do
      token=$1
      args="${args} \"${token}\"" 
      shift
  done
  eval "\"${exe_dir}/batchRun_cremi_A\"" $args
fi
echo finished at: `date`
exit

