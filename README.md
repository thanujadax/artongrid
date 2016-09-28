## Instructions:
https://computing.ee.ethz.ch/Services/SGE

## Setup environment
source /home/sgeadmin/ITETCELL/common/settings.sh      # bash shell

## To compile MATLAB program
```
mcc -m -R -singleCompThread -R -nodisplay -R -nojvm batchRun_cremi_A.m
```

## To submit job
```
qsub batch_sge.sh
```

## Check status
```qstat 
```
