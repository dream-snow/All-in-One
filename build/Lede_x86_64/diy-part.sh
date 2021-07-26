#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# 基本不需要添加啥插件了,我搜集了各位大神的插件都集成一个软件包直接打入源码里面了
# 要了解增加了什么东西，就到我的专用软件包里面看看看吧，如果还是没有你需要的插件，请不要一下子就拉取别人的插件包
# 相同的文件都拉一起，因为有一些可能还是其他大神修改过的容易造成编译错误的
# 想要什么插件就单独的拉取什么插件就好，或者告诉我，我把插件放我的插件包就行了
# 软件包地址：https://github.com/281677160/openwrt-package
# 拉取插件请看《各种命令的简单介绍》第4条、第5条说明,不管大神还是新手请认真的看看,再次强调请不要一下子就拉取别人一堆插件的插件包,容易造成编译错误的

# git clone https://github.com/fw876/helloworld package/luci-app-ssr-plus
# git clone https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall
git clone https://github.com/jerrykuku/luci-app-vssr package/luci-app-vssr
git clone https://github.com/vernesong/OpenClash package/luci-app-openclash
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/luci-app-jd-dailybonus

# git clone https://github.com/garypang13/luci-app-bypass package/luci-app-bypass
svn co https://github.com/garypang13/openwrt-packages/trunk/lua-maxminddb
# find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-redir/shadowsocksr-libev-alt/g' {}
# find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-server/shadowsocksr-libev-server/g' {}


#sed -i "/uci commit fstab/a\uci commit network" $ZZZ
#sed -i "/uci commit network/i\uci set network.lan.ipaddr='192.168.2.2'" $ZZZ                       # IPv4 地址(openwrt后台地址)
#sed -i "/uci commit network/i\uci set network.lan.netmask='255.255.255.0'" $ZZZ                    # IPv4 子网掩码
#sed -i "/uci commit network/i\uci set network.lan.gateway='192.168.2.1'" $ZZZ                      # IPv4 网关
#sed -i "/uci commit network/i\uci set network.lan.broadcast='192.168.2.255'" $ZZZ                  # IPv4 广播
#sed -i "/uci commit network/i\uci set network.lan.dns='192.168.2.1'" $ZZZ                          # DNS(多个DNS要用空格分开)
#sed -i "/uci commit network/i\uci set network.lan.delegate='0'" $ZZZ                               # 去掉LAN口使用内置的 IPv6 管理
#echo "close_dhcp" > package/base-files/files/etc/closedhcp                                         # 关闭DHCP服务

#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile            # 选择argon为默认主题
#sed -i "s/OpenWrt /${Author} Compiled in $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" $ZZZ           # 增加个性名字281677160
#sed -i "/uci commit system/i\uci set system.@system[0].hostname='x86-64-OpenWrt'" $ZZZ             # 修改主机名称为x86-64-OpenWrt
#sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0/$1$PhflQnJ1$yamWfH5Mphs4hXV7UXWQ21:18725/g' $ZZZ   # 替换密码（要替换密码就不能设置密码为空）
#sed -i '/CYXluq4wUazHjmCDBCqXF/d' $ZZZ                                                             # 设置密码为空
#sed -i 's/PATCHVER:=5.4/PATCHVER:=4.19/g' target/linux/x86/Makefile                               # 修改内核版本为4.19
