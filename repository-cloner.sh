#!/usr/bin/env bash

succes=true

# Font: http://patorjk.com/software/taag/#p=display&f=Slant&t=RepoCloner
echo ""
echo "    ____                   ________                     "
echo "   / __ \___  ____  ____  / ____/ /___  ____  ___  _____"
echo "  / /_/ / _ \/ __ \/ __ \/ /   / / __ \/ __ \/ _ \/ ___/"
echo " / _, _/  __/ /_/ / /_/ / /___/ / /_/ / / / /  __/ /    "
echo "/_/ |_|\___/ .___/\____/\____/_/\____/_/ /_/\___/_/     "
echo "          /_/                                          "

# Check if first argument is given
if [ -z "$1" ]
    then
        echo "◈ Please specify repositories file"
        succes=false
    else
    # Extracting repo names out of given file
    readarray -t repositories < $1

    if [ -z "$2" ]
        then
            echo "◇ No target directory specified, executing locally"
        else
            echo "◇ Target directory specified, executing in $2"
            cd $2
    fi

    for repo in "${repositories[@]}"
    do
        name=$(echo $repo | rev | cut -d'/' -f 1 | rev | sed -e 's/\.[^\.]*$//')

        # Downloading the repo
        if [ ! -d "$name" ];
            then
                echo "▶ Cloning $name"
                    git clone $repo
            else
                echo "▶ Updating $name"
                cd $name
                    git pull $repo
                cd ..
        fi
        if [ ! -d "$name" ];
            then
                echo "◈ Cloning $name failed"
                succes=false
        fi
    done
fi

if $succes;
    then
        echo "◇ Execution was succesfull!"
    else
        echo "◈ Execution failed!"
fi