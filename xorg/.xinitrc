export LANG=zh_CN.UTF-8

export XMODIFIERS="@im=fcitx"
export XIM=fcitx
export GTK_IM_MODULE="xim"
export QT_IM_MODULE="xim"


##scrot screenshot save path
scrot=$HOME/Photo/scrot
export scrot

xset -b

compton &
flashfocus &
fcitx -d &
xrdb $HOME/.Xresources

xinput set-prop "ThinkPad Keyboard Mouse" "libinput Scroll Method Enabled" 0 0 1

exec awesome

