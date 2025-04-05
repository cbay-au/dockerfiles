#!/bin/bash

usage() {
    echo "Usage: $0 [OPTIONS]"
    echo "-h, --help          Show help message"
    echo "-p N                Set number of concurrent jobs (default CPU cores)"
}

check_dependencies() {
  local missing=()
  for cmd in make gcc; do 
     if ! command -v "$cmd" &>/dev/null; then
        missing+=("$cmd")
     fi  
   done
 
   [ ${#missing[@]} -eq 0 ] || { echo "Missing dependencies: ${missing[*]}. Exiting."; exit 1; }
}

build_directory() {
    local dir="$1"
    
    # Switch to directory and capture result/errors
    (cd "$dir" && make) &> "$dir.build.log"
    ret=$?
    
    if [ $ret -ne 0 ]; then 
        echo "Build failed for: ${dir}"
        cat "${dir}.build.log"; rm -f "${dir}.build.log"
     else 
        echo "Successfully built: ${dir}"   
      fi
    
}

main() {
  
   check_dependencies

   jobs=$(nproc)
   while getopts ":hp:" opt; do
    case "$opt" in
       h) usage ; exit;;
       p) jobs="$OPTARG";;
       *) echo "Invalid option -$OPTARG. Use -h for help."; exit 1;;
     esac  
   done
 
   dirs=(projectX libraryY src examples)
   
   # Using GNU parallel if available, else fall back to manual
   if command -v parallel &>/dev/null; then
      printf "%s\n" "${dirs[@]}" | parallel -j $jobs build_directory 
    else
       for dir in "${dirs[@]}"; do  
          build_directory "$dir" &
        done

        wait # Wait for all background jobs to complete    
     fi
    
   echo "Build process completed."
}

main "$@"
