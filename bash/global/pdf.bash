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
    pdftk  $* output merge.pdf
}
