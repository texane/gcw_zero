#!/usr/bin/env sh

if [ -z $1 ]; then
 echo 'missing rom name'
 exit
fi

zip_path=$HOME/repo/roms/$1.zip
png_name=$1
png_path=$HOME/repo/roms/$1.png
if [ ! -e $png_path ]; then
 png_name='black'
 png_path='black.png'
fi
opk_path=$HOME/repo/gcw_zero/opk/$1.opk

s='[Desktop Entry]\n'
s=$s'Name='$1'\n'
s=$s'Comment='$1'\n'
s=$s'Exec=./fbasdl.dge ./'$1'.zip\n'
s=$s'Terminal=true\n'
s=$s'Type=Application\n'
s=$s'StartupNotify=false\n'
s=$s'Icon='$png_name'\n'
s=$s'Categories=games;\n'

echo $s > /tmp/default.a320.desktop
echo $s > /tmp/default.gcw0.desktop

mksquashfs \
  /tmp/default.a320.desktop \
  /tmp/default.gcw0.desktop \
  $HOME/repo/gcw_zero/fba/fba-sdl/bin/fbasdl.dge \
  $zip_path \
  $png_path \
  $opk_path \
  -noappend -comp gzip -all-root
