# converts terminator theme $1 to st theme
echo "static const char *colorname[] = {"
echo "/* other colors */"
grep palette "$1" | awk '{print $3}' | sed -e 's/"//g' -e 's/#/"#/g' -e 's/:/",\n/g' -e 's/$/",/'
echo "/* required */"
echo "[255] = 0,"
echo "/* fg, bg, cs */"
grep foreground_color "$1" | awk '{print $3}' | tr -d '\n'
echo ","
grep background_color "$1" | awk '{print $3}' | tr -d '\n'
echo ","
grep cursor_color "$1" | awk '{print $3}' | tr -d '\n'
echo ","
echo "};"
