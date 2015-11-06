/*********************************************
* Roy Pardee
* Group Health Research Institute
* (206) 287-2078
* pardee.r@ghc.org
*
* C:\Users/pardre1/Documents/vdw/dq/sas/read_data.sas
*
* Given a libname, reads the DQCDM csv files into SAS datasets.
*********************************************/

options
  linesize  = 150
  msglevel  = i
  formchar  = '|-++++++++++=|-/|<>*'
  dsoptions = note2err
  nocenter
  noovp
  nosqlremerge
;

%macro read_dqc(mylib) ;

  proc import
    datafile = "%sysfunc(pathname(&mylib))\measure.csv"
    out = &mylib..measures
  ;
  run ;

  proc import
    datafile = "%sysfunc(pathname(&mylib))\dimension_set.csv"
    out = &mylib..dimensions
  ;
  run ;

  proc import
    datafile = "%sysfunc(pathname(&mylib))\result.csv"
    out = &mylib..results
  ;
  run ;

%mend read_dqc ;

libname pcor "C:\Users\pardre1\documents\vdw\dq\data\pcornet_dq" ;

options mprint ;

%read_dqc(mylib = pcor) ;

