#!/bin/bash
# usage: source interactive.sh [-m|--memory <memory per cpu>] [-c|--cpu <number of cpus>]


help() {
    echo "usage:"
    echo "  source interactive.sh [-m|--memory <memory per cpu>] [-c|--cpu <number of cpus>]"
    echo "options:"
    echo "  -h|--help: print this help message"
    echo "  -m|--memory: memory per cpu in GB (default: 8)"
    echo "  -c|--cpu: number of cpus (default: 2)"
    echo "examples:"
    echo "  source interactive.sh -m 4 -c 2"
    echo "  source interactive.sh --memory 4 --cpu 2"
}

mem_per_cpu="8GB"
num_cpus=2

while [ "$#" -gt 0 ]; do
  case "$1" in
    -m|--memory)
      mem_per_cpu="$2"GB
      shift 2
      ;;
    -c|--cpu)
      num_cpus="$2"
      shift 2
      ;;
    -h|--help)
        help
        exit 0
        ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

echo "Requesting $mem_per_cpu per CPU for $num_cpus CPUs"
echo "Total ram requested: $(($num_cpus * ${mem_per_cpu%GB})) GB"

srun --nodes=1 --mem-per-cpu="$mem_per_cpu" --cpus-per-task="$num_cpus" --partition=cpu-interactive --pty /bin/bash