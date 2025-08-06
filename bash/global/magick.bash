png_rm_transparent() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: png_rm_transparent <infile> <outfile>" >&2
        return 1
    fi
    convert $1 -background white -alpha remove -alpha off $2
}
complete -o default -o bashdefault -o filenames png_rm_transparent
