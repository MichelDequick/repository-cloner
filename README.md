# repository-cloner
Shell script that when executed clones or updates a list of GitHub repositories

## Instalation
### Install script
Execute folowing comand to download the script.
1. Install git `sudo apt-get update` and `sudo apt-get install git`
2. Download repository with `git clone https://github.com/MichelDequick/repository-cloner.git`

### Execute script
1. Go to the repository directory `cd repository-cloner`
2. Make the script executable `chmod +x repository-cloner.sh`
3. Execute the script `./repository-cloner.sh <arg1> <arg2>`
    * arg1: path to file containing repositories (required)
    * arg2: path to folder to clone everything in

### Example
Executing `./repository-cloner.sh example.txt /tmp` will clone all repositories mentioned in `example.txt` into the `/tmp` folder
