#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

#=================================================
#	System Required: CentOS 6/7/8
#	Description: Network setting
#	Version: 0.001
#	Author: LY
#	更新内容及反馈: 
#=================================================

sh_ver="1.3.2.44"
github="github"

Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[信息]${Font_color_suffix}"
Error="${Red_font_prefix}[错误]${Font_color_suffix}"
Tip="${Green_font_prefix}[注意]${Font_color_suffix}"
优化系统配置
optimizing_system(){
	sed -i '/net.ipv4.tcp_retries2/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_slow_start_after_idle/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_fastopen/d' /etc/sysctl.conf
	sed -i '/fs.file-max/d' /etc/sysctl.conf
	sed -i '/fs.inotify.max_user_instances/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_syncookies/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_fin_timeout/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_tw_reuse/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_max_syn_backlog/d' /etc/sysctl.conf
	sed -i '/net.ipv4.ip_local_port_range/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_max_tw_buckets/d' /etc/sysctl.conf
	sed -i '/net.ipv4.route.gc_timeout/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_synack_retries/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_syn_retries/d' /etc/sysctl.conf
	sed -i '/net.core.somaxconn/d' /etc/sysctl.conf
	sed -i '/net.core.netdev_max_backlog/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_timestamps/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_max_orphans/d' /etc/sysctl.conf
	sed -i '/net.ipv4.ip_forward/d' /etc/sysctl.conf
	echo "net.ipv4.tcp_retries2 = 8
net.ipv4.tcp_slow_start_after_idle = 0
net.ipv4.tcp_fastopen = 3
fs.file-max = 1000000
fs.inotify.max_user_instances = 8192
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_fin_timeout = 30
net.ipv4.tcp_tw_reuse = 1
net.ipv4.ip_local_port_range = 1024 65000
net.ipv4.tcp_max_syn_backlog = 16384
net.ipv4.tcp_max_tw_buckets = 6000
net.ipv4.route.gc_timeout = 100
net.ipv4.tcp_syn_retries = 1
net.ipv4.tcp_synack_retries = 1
net.core.somaxconn = 32768
net.core.netdev_max_backlog = 32768
net.ipv4.tcp_timestamps = 0
net.ipv4.tcp_max_orphans = 32768
# forward ipv4
net.ipv4.ip_forward = 1">>/etc/sysctl.conf
	sysctl -p
	echo "*               soft    nofile           1000000
*               hard    nofile          1000000">/etc/security/limits.conf
	echo "ulimit -SHn 1000000">>/etc/profile
	read -p "需要重启VPS后，才能生效系统优化配置，是否现在重启 ? [Y/n] :" yn
	[ -z "${yn}" ] && yn="y"
	if [[ $yn == [Yy] ]]; then
		echo -e "${Info} VPS 重启中..."
		reboot
	fi
}
#开始菜单
start_menu(){
clear
echo && echo -e " TCP加速 一键安装管理脚本 ${Red_font_prefix}[v${sh_ver}]${Font_color_suffix}
 更新内容及反馈:  https://blog.ylx.me/archives/783.html 运行./tcp.sh再次调用本脚本 母鸡慎用
  
 
————————————杂项管理————————————
 ${Green_font_prefix}1.${Font_color_suffix} 卸载全部加速
 ${Green_font_prefix}2.${Font_color_suffix} 退出脚本
————————————————————————————————" && echo

	check_status
	echo -e " 当前内核为：${Font_color_suffix}${kernel_version_r}${Font_color_suffix}"
	if [[ ${kernel_status} == "noinstall" ]]; then
		echo -e " 当前状态: ${Green_font_prefix}未安装${Font_color_suffix} 加速内核 ${Red_font_prefix}请先安装内核${Font_color_suffix}"
	else
		echo -e " 当前状态: ${Green_font_prefix}已安装${Font_color_suffix} ${_font_prefix}${kernel_status}${Font_color_suffix} 加速内核 , ${Green_font_prefix}${run_status}${Font_color_suffix}"
		
	fi
	echo -e " 当前拥塞控制算法为: ${Green_font_prefix}${net_congestion_control}${Font_color_suffix} 当前队列算法为: ${Green_font_prefix}${net_qdisc}${Font_color_suffix} "
	
echo
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
