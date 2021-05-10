export XDG_CURRENT_DESKTOP=sway
export XDG_CONFIG_HOME=~/.config
export MOZ_ENABLE_WAYLAND=1
export STUDIO_JDK=/usr/lib/jvm/java-11-openjdk-amd64/
export QT_QPA_PLATFORM=wayland

if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi 


if [ -z $DISPLAY ] && [ "$(tty)" == "/dev/tty1" ]; then
  exec sway
fi
