ffmpeg_mute() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: ${FUNCNAME[0]} <infile> <outfile>" >&2
        return 1
    fi

    set -x
    ffmpeg -i $1 -c copy -an $2
    set +x
}
