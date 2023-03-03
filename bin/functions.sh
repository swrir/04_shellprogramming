#!/bin/bash

function print_good () {
    echo -e "\x1B[01;32m[+]\x1B[0m $1"
}

function print_error () {
    echo -e "\x1B[01;31m[-]\x1B[0m $1"
}

function print_info () {
    echo -e "\x1B[01;34m[*]\x1B[0m $1"
}


CheckWebSvc() {

    #input:srt(nginx|httpd)
    #output :srt(httpd|nginx)
    #functions:
    WEBSVC=$1
    case $WEBSVC in
        nginx)CheckWebSvc=httpd ;;
        httpd)CheckWebSvc=nginx ;;

    esac


        systemctl disable --now $CheckWebSvc
    
}