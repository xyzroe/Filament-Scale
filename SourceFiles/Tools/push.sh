#!/bin/bash

function version {
    IFS='.' read -r -a array <<< "$ver"
    X=${array[0]}
    Y=${array[1]}
    Z=${array[2]}



    Z=$(($Z + 1))

    if [ "$Z" -gt "9" ]; then
        Z=0
        Y=$(($Y + 1))
    fi
    if [ "$Y" -gt "9" ]; then
        Y=0
        X=$(($X + 1))
    fi
    if [ "$X" -gt "9" ]; then
        echo "Version > 9.9.9"
        exit;
    fi


    ver="${X}.${Y}.${Z}"

    echo "$ver"

    sed "s/[0-9].[0-9].[0-9]/$ver/" ../JmcFilamentScale/version.h > ../JmcFilamentScale/version.h_temp
    mv ../JmcFilamentScale/version.h_temp ../JmcFilamentScale/version.h
}

function spaser {
    echo ""
    echo "----------------------------"
    echo ""
}

function commit {
    spaser
    echo -e "v$ver\n\n$(cat ../../commit)" > commit_temp
    cat commit_temp
    spaser
    git commit -a --file=commit_temp
    rm commit_temp
    git status
    spaser
}

function tag {
    spaser
    tag='v'$ver
    echo 'git tag ' $tag
    git tag $tag
    spaser
}

function push {
    spaser
    echo 'git push'  
    git push
    git push origin --tags
    spaser
}

file="../JmcFilamentScale/version.h" 
ver=$(echo $(cat "$file") | egrep -o '(\d+\.\d+\.\d+-?\w*)')

echo 'Push script for Filament-Scale Firmware v'$ver
spaser
while true; do
    read -p "Increase version? (y/n) " yn
    case $yn in
        [Yy]* ) version; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

git status
spaser

while true; do
    read -p "Make commit? (y/n) " yn
    case $yn in
        [Yy]* ) commit; break;;
        [Nn]* ) spaser; echo 'Finished'; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

while true; do
    read -p "Put tag? (y/n) " yn
    case $yn in
        [Yy]* ) tag; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

while true; do
    read -p "Push origin? (y/n) " yn
    case $yn in
        [Yy]* ) push; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo 'Finished'