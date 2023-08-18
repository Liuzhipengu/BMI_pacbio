# Software prerequisites

This pipeline is designed to run on Linux servers and requires the following software.

``` sh
# Use conda install
SMRT-LINK #https://www.pacb.com/support/software-downloads
gmap 
cDNA_Cupcake
SQANTI3
```
# Software installation

``` sh
# install SMRT LINK
wget -c https://downloads.pacbcloud.com/public/software/installers/smrtlink_12.0.0.177059.zip
unzip smrtlink_12.0.0.177059.zip
./smrtlink_12.0.0.177059.run --rootdir /your_dir/smrtlink/smrtlink --no-extract
# Add SMRT LINK to the $PATH
export PATH=/your_dir/smrtlink/smrtcmds/bin:$PATH
# install SQANTI3
git clone https://github.com/ConesaLab/SQANTI3.git
cd SQANTI3
mv SQANTI3.conda_env.yml pippacbio.yml
source activate pippacbio
cd .
## install cDNA_Cupcake
git clone https://github.com/Magdoll/cDNA_Cupcake.git
cd cDNA_Cupcake
python setup.py build
python setup.py install
cd .
## install gmap
conda install gmap
```
# Pipeline setup

``` sh
wget -c https://ftp.ensembl.org/pub/release-110/fasta/sus_scrofa/dna/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa.gz
# build genome index
gmap_build -d ssc_ens107db Sus_scrofa.Sscrofa11.1.dna.toplevel.fa.gz
```
# Usage

``` sh
git clone git@github.com:zhipengliu92/pipIsoseq.git
source activate pippacbio
export PYTHONPATH=$PYTHONPATH:<path_to>/cDNA_Cupcake/sequence/
export PYTHONPATH=$PYTHONPATH:<path_to>/cDNA_Cupcake/

```

