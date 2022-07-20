# Molecular Dynamics Workshop
André Guerra \
July, 2022 \
andre.guerra@mail.mcgill.ca  

## Contents
1. Overview
2. Preparation
3. 

## Overview
This markdown file will include the main contents of this workshop. Here, we will discuss any important information and describe some of the main aspects of the molecular dynamics (MD) workflow demonstrated in this repository.

## Preparation 
First, we will install the necessary software for executing our MD workflow. The following list is intended as a guide to get started. It may not be comprehensive for all purposes. Please refer to each software's webpage for details/requirements of installation. We will use [PACKMOL](http://leandro.iqm.unicamp.br/m3g/packmol/examples.shtml), [Moltemplate](https://www.moltemplate.org/), and [LAMMPS](https://www.lammps.org/).

For the time being, I will assume that you are using a Linux machine (or WSL in Windows10) and that you are familiar with terminal commands. In the future, I may incorporate more detailed instructions on setting up your machine for running this workflow.

### Auxilliary
1. Install miniconda package manager
    Download the executable installer for Linux x86_64.
    ```
    curl -sL \
    "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh" > \
    "Miniconda3.sh"
    ```
    Run installer.
    ```
    bash Miniconda3.sh
    ```
2. Install git version control
    ```
    sudo apt install git
    ```
### LAMMPS
More details on LAMMPS can be found [here](https://www.lammps.org/).
1. Create a conda environment of LAMMPS 
    ```
    conda create -n lammps
    ```
2. Install LAMMPS
    Activate the conda environment
    ```
    conda activate lammps
    ```
    Install LAMMPS
    ```
    conda install lammps -c conda-forge
    ```
*NOTE:* From this point on, you need to activate the `lammps` conda environment before running LAMMPS.

3. Clone the LAMMPS git repository in a directory called lammps in home (i.e., `~/lammps`)
    ```
    git clone -b stable https://github.com/lammps/lammps.git ~/lammps
    ```
4. Test LAMMPS
    This will run the example script VISCOSITY provided in the LAMMPS repository. It will take a minute or two to completely run.
    ```
    cd ~/lammps/examples/VISCOSITY/ && lmp_serial -in in.wall.2d
    ```
If the example simulation ran correctly, at this point LAMMPS is fully installed. 

### Moltemplate
More details on Moltemplate can be found [here](https://www.moltemplate.org/).
1. Clone the Moltemplate git repository in a directory called moltemplate in home (i.e., `~/moltemplate`)
    ```
    git clone https://github.com/jewettaij/moltemplate ~/moltemplate
    ```
2. Update your system
    ```
    sudo apt update && sudo apt upgrade
    ```
3. Build moltemplate
    ```
    cd ~/moltemplate && pip install . --user
    ```
4. Export `.local/bin` to PATH
    ```
    export PATH=/home/user/.local/bin:$PATH && source .bashrc
    ```
5. Test Moltemplate
    ```
    cd ~/moltemplate/examples/all_atom/force_field_OPLSAA/waterSPC_using_OPLSAA/moltemplate_files/ \
    && moltemplate.sh system.lt
    ```
If the script ran without problems, at this point Moltemplate is fully installed.

### PACKMOL
More details on PACKMOL can be found [here](http://leandro.iqm.unicamp.br/m3g/packmol/examples.shtml).
1. Clone the git repository in a directory called packmol in home (i.e., `~/packmol`)
    ```
    git clone http://github.com/mcubeg/packmol ~/packmol
    ```
2. Install FORTRAN compiler
    ```
    sudo apt install gfortran
    ```
3. Compile PACKMOL
    ```
    cd ~/packmol && make
    ```
4. Download the PACKMOL example scripts
    ```
    cd ~/packmol && \
    curl -sL \
    "http://leandro.iqm.unicamp.br/m3g/packmol/examples/examples.tar.gz" > \
    examples.tar.gz
    ```
    Extract the examples from the tar archive
    ```
    tar -xvf examples.tar.gz
    ```
5. Export packmol to PATH
    ```
    export PATH=~/packmol:$PATH 
    ```
6. Test PACKMOL
    ```
    cd ~/packmol/examples/ && packmol < bilayer.inp
    ```
If the script ran without problems, at this point PACKMOL is fully installed.
