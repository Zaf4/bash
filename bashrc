# specific to the cluster

alias sq="squeue --user $USER"

## interactive sessions
alias inter1="srun --nodes=1 --mem-per-cpu='4GB' --cpus-per-task=4 --partition=cpu-interactive --pty /bin/bash"
alias inter2="srun --nodes=1 --mem-per-cpu='4GB' --cpus-per-task=8 --partition=cpu-interactive --pty /bin/bash"
alias inter3="srun --nodes=1 --mem-per-cpu='8GB' --cpus-per-task=16 --partition=cpu-interactive --pty /bin/bash"
alias inter4="srun --nodes=1 --mem-per-cpu='8GB' --cpus-per-task=32 --partition=cpu-interactive --pty /bin/bash"
alias inter5="srun --nodes=1 --mem-per-cpu='16GB' --cpus-per-task=32 --partition=cpu-interactive --pty /bin/bash"

## modules
alias load='module load'
alias unload='module unload'
alias avail='module avail'

# general purpose
alias refresh='source ~/.bashrc'
alias python='python3'
alias pip='pip3'
