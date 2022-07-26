#-------------------------------------------------------------------------------------------------------
# Author        : André Guerra
# Date          : November, 2021
# Description   : automation script to run packmol, moltemplate, & lammps in sequence
# Notes         : 
# Updated       : July, 2022
#-------------------------------------------------------------------------------------------------------

#  0. Prep
# handle flag(s)
while getopts g:w:d:e:s:r:n:f:p: flag
do
    case "${flag}" in
        g) gas=${OPTARG};;
        w) water=${OPTARG};;
        d) seed=${OPTARG};;
        e) ensemble=${OPTARG};;
        s) steps=${OPTARG};;
        r) restart=${OPTARG};;
        n) restartFreq=${OPTARG};;
        f) restartFile=${OPTARG};;
        p) rep=${OPTARG};;
    esac
done

# 1. Execute PACKMOL
echo -------------------------------------------------
echo ">>>PACKMOL: $(date)<<<"
echo ">>>"
if [ $restart = 'false' ]
then
    # cd into packmol dir
    cd 1_packmol/
    # run packmol
    packmol < in_2pack_H2O.inp
    # return to original project directory
    cd ../
fi

# source lammps env
conda activate lammps

# 2. Execute MOLTEMPLATE
echo -------------------------------------------------
echo ">>>MOLTEMPLATE: $(date)<<<"
echo ">>>"
if [ $restart = 'false' ]
then
    # go into 2_moltemplate/input_files/
    cd 2_moltemplate/input_files
    # define system identify
    cp system_H2O.lt system.lt
    # run moltemplate giving system.lt as input and the data file generated by packmol
    moltemplate.sh -xyz ../../1_packmol/out_packed.xyz system.lt
    # delete input lammps script produced
    rm system.in
    # remove extra information in settings and data files
    cleanup_moltemplate.sh
    # copy the output files to the lammps directory for execution
    cp system.data ../../3_lammps
    # cp system.data system.in* ../../3_lammps/equil
    # move the output files up to the parent directory
    mv -f system.data system.in* ../
    # delete the temporary files produced by moltemplate
    # these are good for debugging, comment if debugging is necessary
    rm -rf output_ttree/
    # return to original project directory
    cd ../../
fi

# 3. Execute LAMMPS
echo -------------------------------------------------
echo ">>>LAMMPS: $(date)<<<"
echo ">>>"

cd 3_lammps/
# run 
lmp_serial -in run.ag.in -log log.$ensemble.lammps \
-v gas $gas \
-v wat $water \
-v seed $seed \
-v restart_sim $restart \
-v restart_freq $restartFreq \
-v ensemble $ensemble \
-v restartFile $restartFile \
-v steps $steps \
-v replicate $rep
# remove extra restarts if the restartEnd exists
if [ -f restart/restartEnd_${ensemble}_${steps}step.data ]
then
    rm restart/restart_$ensemble*
fi
# back up to test dir
cd ../
