#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
# DIY扩展二合一了，在此处可以增加插件
# 自行拉取插件之前请SSH连接进入固件配置里面确认过没有你要的插件再单独拉取你需要的插件
# 不要一下就拉取别人一个插件包N多插件的，多了没用，增加编译错误，自己需要的才好
# 修改IP项的EOF于EOF之间请不要插入其他扩展代码，可以删除或注释里面原本的代码



cat >$NETIP <<-EOF
uci set network.lan.type='bridge'
uci set network.lan.ifname='eth1 eth2 eth3'
uci set network.lan.proto='static'
uci set network.lan.ipaddr='192.168.20.2'                                    # IPv4 地址(openwrt后台地址)
uci set network.lan.netmask='255.255.255.0'                                 # IPv4 子网掩码
uci set network.lan.gateway='192.168.20.1'                                   # IPv4 网关
uci set network.lan.broadcast='192.168.20.255'                               # IPv4 广播
uci set network.lan.dns='114.114.114.114 223.5.5.5'                         # DNS(多个DNS要用空格分开)
uci set network.lan.delegate='0'                                            # 去掉LAN口使用内置的 IPv6 管理
  
uci set network.wan.ifname='eth0'
uci set network.wan._orig_ifname='eth0'
uci set network.wan._orig_bridge='false'
uci set network.wan.proto='pppoe'
uci set network.wan.password='123456'
uci set network.wan.ipv6='auto'
uci set network.wan.keepalive='0'
# uci set network.wan.username=''
uci set network.wan.delegate='0'
  
uci commit network                                                          # 不要删除跟注释,除非上面全部删除或注释掉了
uci set dhcp.lan.ignore='1'                                                 # 关闭DHCP功能
uci commit dhcp                                                             # 跟‘关闭DHCP功能’联动,同时启用或者删除跟注释
# uci set system.@system[0].hostname='OpenWrt-123'                            # 修改主机名称为OpenWrt-123
EOF



# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile           # 选择argon为默认主题

sed -i "s/OpenWrt /${Author} compiled in $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" $ZZZ          # 增加个性名字${Author}默认为你的github账号

# sed -i '/CYXluq4wUazHjmCDBCqXF/d' $ZZZ                                                            # 设置密码为空

# sed -i 's/PATCHVER:=5.10/PATCHVER:=5.4/g' target/linux/x86/Makefile                              # 默认内核5.10，修改内核为5.4

# K3专用，编译K3的时候只会出K3固件
#sed -i 's|^TARGET_|# TARGET_|g; s|# TARGET_DEVICES += phicomm_k3|TARGET_DEVICES += phicomm_k3|' target/linux/bcm53xx/image/Makefile


# 修改插件名字
# sed -i 's/"aMule设置"/"电驴下载"/g' `grep "aMule设置" -rl ./`
# sed -i 's/"网络存储"/"存储"/g' `grep "网络存储" -rl ./`
# sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' `grep "Turbo ACC 网络加速" -rl ./`
# sed -i 's/"实时流量监测"/"流量"/g' `grep "实时流量监测" -rl ./`
# sed -i 's/"KMS 服务器"/"KMS激活"/g' `grep "KMS 服务器" -rl ./`
# sed -i 's/"TTYD 终端"/"命令窗"/g' `grep "TTYD 终端" -rl ./`
# sed -i 's/"USB 打印服务器"/"打印服务"/g' `grep "USB 打印服务器" -rl ./`
# sed -i 's/"Web 管理"/"Web"/g' `grep "Web 管理" -rl ./`
# sed -i 's/"管理权"/"改密码"/g' `grep "管理权" -rl ./`
# sed -i 's/"带宽监控"/"监控"/g' `grep "带宽监控" -rl ./`
# sed -i 's/"Argon 主题设置"/"Argon设置"/g' `grep "Argon 主题设置" -rl ./`
