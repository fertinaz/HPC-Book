#!/bin/bash

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

workdir=/Users/fatih.ertinaz@ibm.com/Reports
project=HPC-Book

timestamp=$(date +%Y%m%d%H%M)

archive=$timestamp.tar.gz

dest=$HOME/icloud/Projects/HPC-Book-bak
if [[ ! -d $dest ]]; then 
  printf "\n"
  printf "[+] Destination directory: $dest doesn't exist. Exiting. \n"
  exit 1
fi

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

cd $workdir

printf "\n"
printf "[+] Compress current snapshot... \n"
tar -czf $archive $project 2>/dev/null
if [[ $? -eq 0 ]]; then 
  printf "\t [-] Success! \n"
else
  printf "\t [-] Error occurred. Exiting. \n"
  exit 1;
fi

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

printf "\n"
printf "[+] Send $archive to iCloud back-up directory... \n"
rsync -avzh --quiet --remove-source-files $archive $dest 2>/dev/null
if [[ $? -eq 0 ]]; then 
  printf "\t [-] Success! \n"
else
  printf "\t [-] Error occurred. Exiting. \n"
  exit 1;
fi

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

printf "\n"
printf "[+] Back-up is done successfully. Exiting. \n"
exit 0

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
