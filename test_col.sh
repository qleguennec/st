cd themes
for i in *.h; do sed -i 's/include .*/include "themes\/'$i'"/' ../config.h && make -C .. && echo "$i" && ../st -g 1600x1200; done
