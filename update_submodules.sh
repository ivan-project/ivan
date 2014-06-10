#!/bin/bash
modules=(vagrant queue diff lemmatizer frontend dictionary_importer)
for i in "${modules[@]}"
do
    if [[ $i ]]; then
        cd $i
        git reset --hard
        git pull origin master
        cd ../
    fi
done
