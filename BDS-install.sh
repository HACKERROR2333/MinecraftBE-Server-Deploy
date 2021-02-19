#!/bin/bash
#Github: https://github.com/HACKERROR2333/MinecraftBE-Server-Deploy
#Owner: HACKERROR2333
export bin="/data/data/com.termux/files/usr/bin"
export HOME="/data/data/com.termux/files/home"
export Server_Path=$HOME/.local/share/MinecraftBE-Server
##########function
Re_Inatall(){
    rm -rf $Server_Path/BSD/*
    Install_Check
    Install_BDS
}
Install_BDS(){
    unzip $Downfile    
    dialog --title "MinecraftBE Server Deploy" --no-shadow --yesno "输入MSD启动Server" 10 30
}
Install_Check(){
    echo "即将开始安装..."
    wget -P $Server_Path/BDS https://minecraft.azureedge.net/bin-linux/bedrock-server-1.16.201.03.zip
    Downfile=`ls $Server_Path/BDS`
    MC_Version=${Downfile:15:(24-15)}
    dialog --title "MinecraftBE Server Deploy" --no-shadow --yesno "由于BDS的原因 只能架设最新Server 即$MC_Version 确定继续？" 10 30
    case $? in
        0)
            Install_BDS;;
        1)
            exit 0;;
    esac
}
##########check_files
if [ -d $Server_Path/BDS ];then
    dialog --title "MinecraftBE Server Deploy" --no-shadow --yesno "Server已安装 选择Yes将重新安装" 10 30
    case $? in
        0)
            Re_Inatall;;
        1)
            exit 0;;
    esac
fi
if [ ! -f $Server_Path/input.log ];then
    echo "补全依赖..."
    mkdir $HOME/.local/share/MinecraftBE-Server
    mkdir $HOME/.local/share/MinecraftBE-Server/BDS
    pkg install dialog zip wget -y
fi
##########main
dialog --title "MinecraftBE Server Deploy" --no-shadow --yesno "这是用BDS部署MCBE服务器的脚本 确定继续？" 10 30
case $? in
    0)
        Install_Check;;
    1)
        exit 0;;
esac
