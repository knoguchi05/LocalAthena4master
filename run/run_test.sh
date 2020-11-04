#!/bin/sh

DATE=$(date '+%Y%m%d%H%M')
dateMMDD=$(date '+%m%d')
bque=12h
source $TestArea/../build/*/setup.sh
#INPUT_LIST="/home/ktaniguc/atlas/list_set/RPCclustering_JpsiCollimated_1-300.list"
INPUT_LIST="./lists/Jpsi.test.list"

if [ -f $INPUT_LIST ] ; then
  for INPUT_FILE in `cat $INPUT_LIST`
  do
    echo "INPUT_FILE = "$INPUT_FILE
    TMP_DIR=`echo "$INPUT_FILE" | sed -e "s:/:_:g"`
    SUB_TAR="/gpfs/fs7001/ktaniguc/outputfile/test_2mu-in-1padchain/$DATE/$TMP_DIR/processing"
    mkdir -p $SUB_TAR
    cp ./*.sh $SUB_TAR
    cd $SUB_TAR
    bsub -q ${bque} -o log.out -n 2 "./RDO2AOD_test.sh ${INPUT_FILE}"
    cd -
  done
fi
