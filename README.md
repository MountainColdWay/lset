a new user
上面是一些系统设置，archlinux

上面的是一些基本配置，有些是从网上选取改造的，有些是自己写的。
关于xterm，xterm用了网上一些配置,改了一些地方，xterm的字体方面特别麻烦，因为我对字体库没有很好的了解，不知道含有那些具体的字体，你们可以参考arch的wiki上的字体包自己尝试更改或者安装，对于xterm的颜色设置上我直接搬了网上的一个配置，使它更像gnome-terminal的solarized主题。https://github.com/solarized/xresources
xterm要支持fcitx输入法，根据网上的资料，.xinitrc文件要写一些莫名其妙的配置，就如同我写的那样，同时我感觉要bell～的一声特别不舒服，我在.xinitrc当中添加了禁止bell，同时xterm的设置的设置当中也有相同的设置
字体：pacman -S ttf-roboto noto-fonts noto-fonts-cjk adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts ttf-dejavu 字体方面有些坑跌，如果只是装了上面的一部分字体，可能导致字体形状发生改变，这个问题相当的神奇，如果不是强迫症患者，我觉得你还是直接ctrl-c ctrl-v 回车完事。
