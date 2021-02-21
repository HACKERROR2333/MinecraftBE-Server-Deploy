#!/bin/bash
#Github: https://github.com/HACKERROR2333/MinecraftBE-Server-Deploy
#Owner: HACKERROR2333
export bin="/data/data/com.termux/files/usr/bin"
export HOME="/data/data/com.termux/files/home"
export Server_Path=$HOME/.local/share/MinecraftBE-Server
##########function
BDS(){
    echo "拉取安装脚本中..."
    wget -P $Server_Path http://81.70.86.213/BDS-install.sh
    chmod +x $Server_Path/BDS-install.sh
    sh $Server_Path/BDS-install.sh
}
Start_BDS(){
    sh $Server_Path/BDS/bedrock_server
}
Deploy_Server(){
dialog --title "MinecraftBE Server Deploy"--menu "by HACKERROR" 20 30 10 1 "使用BDS部署" 2 "使用nukkit部署（后续补上" 3 "使用PowerNukkit部署（后续补上" 0 "退出"
case $? in
    1)
        BDS;;
    2)
        echo "挖坑待补";;
    3)
        echo "挖坑待补";;
    0)
        exit 0;;
esac
}
Start_Server(){
dialog --menu "MinecraftBE Server Deploy" 20 30 10 1 "启动BDS Server" 2 "启动Nukkit Server" 3 "启动PowerNukkit Server" 0 "退出"
case $? in
    1)
        Start_BDS;;
    2)
        echo "挖坑带补";;
    3)
        echo "挖坑待补";;
    0) 
        exit 0;;
esac
}
##########main
dialog --menu "MinecraftBE Server Deploy" 20 30 10 1 "启动Server" 2 "部署Server" 0 "退出"
case $? in
    1)
        Start_Server;;
    2)
        Deploy_Server;;
    0)
        exit 0;;
esac

