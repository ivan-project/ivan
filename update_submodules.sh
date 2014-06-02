#!/bin/bash
modules=( vagrant queue diff lemmatizer frontend )
for i in "${modules[@]}"
do
   cd $i
   git reset --hard
   git pull
   cd ../
done