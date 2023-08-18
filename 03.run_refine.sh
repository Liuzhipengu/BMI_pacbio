#!/bin/bash
#Usage
if [ ! -n "$1" ]
then
	echo "	Part 3: refine reads"
	echo "	Usage: bash `basename $0` [*.ccs.fl.*Clontech_3p.bam]"
	echo "	Example: bash `basename $0` JJ27_Tes.ccs.fl.*Clontech_3p.bam"
	echo "	Output: full-length non-concatemer reads [*.ccs.fl.NEB_5p--NEB_Clontech_3p.flnc.bam or Clontech_5p]"
else
	data=$1
	echo "`basename $0`"
	echo ">>Starting the pipeline to refine reads"
	echo "	Input data: "$data
	prefix=`ls $data|sed 's/.bam//'`
	st=`date`
	isoseq3 refine $data ~/pacbio/mytest/primer.fasta ${prefix}.flnc.bam --require-polya --num-threads 2
	ed=`date`
	echo "	Output data: "${prefix}.flnc.bam
	bn=`samtools view $data |grep -v "^@"|wc -l`
	echo "**Statistical**"
	echo "Before refining: "$bn
	an=`samtools view ${prefix}.flnc.bam|grep -v "^@"|wc -l`
	echo "After refining: "$an
	echo "Start time: "$st
	echo "End time: "$ed
	echo "Done running `basename $0`"
	echo "**********************************************************************************"
fi
