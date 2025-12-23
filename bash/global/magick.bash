png_rm_transparent() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: ${FUNCNAME[0]} <infile> <outfile>" >&2
        return 1
    fi
    convert $1 -background white -alpha remove -alpha off $2
}
complete -o default -o bashdefault -o filenames png_rm_transparent

# you may need to install librsvg
# density => DPI for vector rasterization
# 3000x => width=3000, height=aspect ratio
# x3000 => height=3000, widther=aspect ratio

svg_to_png() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: ${FUNCNAME[0]} <infile> <outfile>" >&2
        return 1
    fi
    convert -density 300 $1 -background none -resize 3000x $2
}

svg_to_png_notransparent() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: ${FUNCNAME[0]} <infile> <outfile>" >&2
        return 1
    fi
    convert -density 300 $1 -resize 3000x $2
}
