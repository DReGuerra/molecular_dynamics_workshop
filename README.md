# Molecular Dynamics Workshop
André Guerra \
July, 2022 \
andre.guerra@mail.mcgill.ca  

---
Description: \
This is repository contains an introduction to molecular dynamics (MD) simulations using [PACKMOL](http://leandro.iqm.unicamp.br/m3g/packmol/examples.shtml), [Moltemplate](https://www.moltemplate.org/), and [LAMMPS](https://www.lammps.org/). I have tried to demonstrate a workflow for simulating a simple system. This workflow can be modified and extented as desired for your project. The system molecule coordinates are defined in `1_packmol`, and the PACKMOL software is used to populate a simulation box. Next, the system's data file is generated with Moltemplate in `2_moltemplate`. Finally, the LAMMPS simulation is conducted in `3_lammps`. This tree structure is designed to contain the workflow, segregate files used/produced by different software packages, and ultimately to organize our project space. The bash script `run.sh` executes the workflow.

---
## Core Contents
1. `1_packmol/` $\rightarrow$ files associated with PACKMOL
2. `2_moltemplate` $\rightarrow$ files associated with Moltemplate
3. `3_lammps` $\rightarrow$ files associated with LAMMPS
4. `main.md` $\rightarrow$ this file contains the main content of this workshop
5. `run.sh` $\rightarrow$ bash script that runs the MD workflow
6. `run_cvmfs.sh` $\rightarrow$ modified bash script that runs the MD workflow on a cluster with [slurm scheduler](https://slurm.schedmd.com/documentation.html) and the [CVMFS](https://cernvm.cern.ch/fs/) stack