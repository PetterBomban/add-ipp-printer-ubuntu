#!/bin/bash

clear

addPrinter()
{
    lpadmin -p EveryonePrint -v ipp://YOUR-LINK-HERE -o printer-is-shared=false -P /usr/share/ppd/Ricoh-MP_C4503-Postscript-Ricoh.ppd -E

    ## Set EveryonePrint as default printer
    lpadmin -d EveryonePrint
}

# Check to see if the ppd (driver) is already installed
if [ -e /usr/share/ppd/Ricoh-MP_C4503-Postscript-Ricoh.ppd ]
then
    echo "Already installed print driver, adding printer.."
    addPrinter
else
    ## Download the print driver
    echo "Downloading printing drivers, please wait.."
    echo "If asked for a password, type in your login password."
    sudo wget -O /usr/share/ppd/Ricoh-MP_C4503-Postscript-Ricoh.ppd *DRIVER-FILE-LINK* --timeout 10

    clear

    echo "Adding printer.."
    addPrinter
fi
