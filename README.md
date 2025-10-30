# config-demo-nf

This workflow is used to demonstrate configuration layering as it relates to HPC job schedulers and profiles in Nextflow. 

## Execution instructions

To run locally on Setonix: 
```
module load nextflow/24.10.0

nextflow run main.nf 
```

To run with slurm scheduler: 
```
module load nextflow/24.10.0

nextflow run main.nf -profile slurm --setonix_account <provide-account>
```

To run locally on Gadi: 
```
module load nextflow

nextflow run main.nf 
```

To run with slurm scheduler: 
```
module load nextflow

nextflow run main.nf -profile pbspro --gadi_account <provide-account>
```



