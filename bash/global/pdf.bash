# https://stackoverflow.com/a/50237222
pdf_printfix() {
    mkdir -p print_fixed
    ps2pdf "$1" "print_fixed/$1"
}

pdf_printfix_all() {
    mkdir -p print_fixed
    shopt -s nullglob
    for file in *.pdf; do
        echo "PROCESSING: $file"
        ps2pdf "$file" "print_fixed/$file"
    done
}

pdf_merge() {
    # check merge.pdf does not exist
    if [ -f merge.pdf ]; then
        echo "merge.pdf already exists. Please remove it first."
        return 1
    fi
    
    # variable of all merged
    set -x
    pdftk  $* output merge.pdf
    set +x
}

pdf_extract() {
    # check extract.pdf does not exist
    if [ -f extract.pdf ]; then
        echo "extract.pdf already exists. Please remove it first."
        return 1
    fi

    pages=("${@:2}")
    set -x
    pdftk $1 cat $pages output extract.pdf
    set +x
}

pdf_compress() {
    # check compress.pdf does not exist
    if [ -f compress.pdf ]; then
        echo "compress.pdf already exists. Please remove it first."
        return 1
    fi
    # /screen   - lowest quality, smallest size (72 dpi images)
    # /ebook    - good middle ground (150 dpi), usually what you want
    # /printer  - higher quality (300 dpi)
    # /prepress - highest quality, largest size
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 \
       -dPDFSETTINGS=/ebook \
       -dNOPAUSE -dBATCH -dQUIET \
       -sOutputFile=compress.pdf $1
}
