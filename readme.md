This docker image sets up the environment to run Bowtie2 version 2.3.3.1

You will need an index reference to run this.

I built my refernce using this image by submitting as a slurm job via `sbatch jobs/build_bowtie_index.job`. At 16 threads and 2g per thread it took about X hours.


---- Helpful commands ----

Init:  
`cd /datastore/alldata/shiny-server/rstudio-common/dbortone/docker/bowtie2/; ls
my_image=bowtie2_2.3.3.1:1`

Run interactive session as root:  
`srun --pty -c 1 --mem 1g -p dockerbuild docker run -v /datastore:/datastore:shared -it dockerreg.bioinf.unc.edu:5000/${my_image} bash`

Run interactive session as yoourself:  
`srun --pty -c 1 --mem 1g -p docker docker run -v /datastore:/datastore:shared -v /home/dbortone/scratch:/home/dbortone/scratch -it dockerreg.bioinf.unc.edu:5000/${my_image} bash`

Build the image:  
`srun --pty -c 2 --mem 1g -w c6145-docker-2-0.local -p docker docker build -t dockerreg.bioinf.unc.edu:5000/${my_image} .`

Push the image:  
`srun --pty -c 2 --mem 1g -w c6145-docker-2-0.local -p docker docker push dockerreg.bioinf.unc.edu:5000/${my_image}`

Pull the image to other nodes:  
`srun --pty -c 1 --mem 1g -w r820-docker-2-0.local -p docker docker pull dockerreg.bioinf.unc.edu:5000/${my_image}
srun --pty -c 1 --mem 1g -w r820-docker-2-1.local -p docker docker pull dockerreg.bioinf.unc.edu:5000/${my_image}
srun --pty -c 1 --mem 1g -w fc830-docker-2-0.local -p docker docker pull dockerreg.bioinf.unc.edu:5000/${my_image}
srun --pty -c 1 --mem 1g -w c6100-docker-2-0.local -p dockerbuild docker pull dockerreg.bioinf.unc.edu:5000/${my_image}`


Check build works:  
`srun --pty -c 1 --mem 1g -p docker -w c6145-docker-2-0.local docker run -v /datastore:/datastore:shared dockerreg.bioinf.unc.edu:5000/bowtie2_2.3.3.1:1 bash -c "bowtie2-build --help"`
`srun --pty -c 1 --mem 1g -p docker -w c6145-docker-2-0.local docker run -v /datastore:/datastore:shared dockerreg.bioinf.unc.edu:5000/bowtie2_2.3.3.1:1 bash -c "bowtie2 --help"`

Run a sample:  
`sbatch jobs/test_sample.job`

