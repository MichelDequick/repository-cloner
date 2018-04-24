#!/usr/bin/env bash

succes=true

# Check if first argument is given
if [ $# -eq 0 ]
    then
        echo "├ Please specify repositories file"
        succes=false
    else
    # Extracting repo names out of given file
    readarray -t repositories < $1

    if [ $# -eq 0 ]
        then
            echo "├ No target directory specified, executing locally"
        else
            echo "├ Target directory specified, executing in $2"
            cd $2
    fi

    for repo in "${repositories[@]}"
    do
        name=$(echo $repo | rev | cut -d'/' -f 1 | rev | sed -e 's/\.[^\.]*$//')

        # Downloading the repo
        if [ ! -d "$name" ];
            then
                echo "├ Cloning $name"
                {
                    git clone $repo
                } 2> /dev/null
            else
                echo "├ Directory $name already exists, pulling latest version..."
                cd $name
                {
                    git pull $repo
                } 2> /dev/null
                cd ..
        fi
        if [ ! -d "$name" ];
            then
                echo "├ Cloning $name failed"
                succes=false
        fi
    done
fi

if $succes;
    then
        echo "└ Executed succesfully"
    else
        echo "└ Execution failed!"
fi