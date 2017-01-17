#!/bin/bash
# CC Leomar Viegas Junior
#

SSID=$(iwgetid -r)
VOLUME=$(nfsiostat | grep -i 'nfs' | cut -d ' ' -f 2)

if [ "$SSID" == "Inverness-5" ] || [ "$SSID" = "Inverness" ] ; then
    echo "Home Wilreless DETECTED!!! There's no place like Home!!!" ;
    
    if [ "$VOLUME" == "mounted" ] ; then
        echo "NFS Volume already mounted!" ;
    else
    echo "Mounting Home Storage!" ;
        NFS_MOUNT=$(mount.nfs nasleomar:/nfs /nfs -o rsize=8192,wsize=8192,timeo=14,intr,tcp)
        $NFS_MOUNT
    echo "NFS Volume ready!";
    fi
else
    echo "Not at home...nothing to do."
fi

