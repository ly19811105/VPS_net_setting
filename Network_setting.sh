#!/usr/bin/env bash
#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

#=================================================
#	System Required: CentOS 6/7/8
#	Description: Network setting
#	Version: 0.001
#	Author: LY
#	更新内容及反馈: 
#=================================================


#开始菜单
start_menu(){
clear
echo && echo -e " TCP加速 一键安装管理脚本 ${Red_font_prefix}[v${sh_ver}]${Font_color_suffix}
 更新内容及反馈:  https://blog.ylx.me/archives/783.html 运行./tcp.sh再次调用本脚本 母鸡慎用
  
 
————————————杂项管理————————————
 ${Green_font_prefix}1.${Font_color_suffix} 卸载全部加速
 ${Green_font_prefix}2.${Font_color_suffix} 退出脚本
————————————————————————————————" && echo
	
read -p " 请输入数字 :" num
case "$num" in
	0)
	Update_Shell
	;;
	1)
	optimizing_system
	;;
	2)
	exit 1
	;;
	3)
	check_sys_Lotsever
	;;
	4)
	check_sys_xanmod
	;;
	5)
	check_sys_bbr2
	;;
	6)
	check_sys_zen
	;;
	7)
	check_sys_bbrplusnew	
	;;
	8)
	gototeddysun_bbr
	;;
	9)
	gototcpx	
	;;
	11)
	startbbrfq
	;;
	12)
	startbbrcake
	;;
	13)
	startbbrplus
	;;
	14)
	startlotserver
	;;
	15)
	startbbr2fq
	;;
	16)
	startbbr2cake
	;;
	17)
	startbbr2fqecn
	;;
	18)
	startbbr2cakeecn
	;;
	21)
	remove_all
	;;
	22)
	optimizing_system
	;;
	23)
	exit 1
	;;
	*)
	clear
	echo -e "${Error}:请输入正确数字 [0-23]"
	sleep 5s
	start_menu
	;;
esac
}
judge_mode
list "$1"
