ffmpeg_mute() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: ${FUNCNAME[0]} <infile> <outfile>" >&2
        return 1
    fi

    set -x
    ffmpeg -i $1 -c copy -an $2
    set +x
}

ffmpeg_rot_cw90() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: ${FUNCNAME[0]} <infile> <outfile>" >&2
        return 1
    fi

    set -x
    ffmpeg -i $1 -vf "transpose=1" $2
    set +x
}

ffmpeg_rot_ccw90() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: ${FUNCNAME[0]} <infile> <outfile>" >&2
        return 1
    fi

    set -x
    ffmpeg -i $1 -vf "transpose=2" $2
    set +x
}

ffmpeg_rot_180() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: ${FUNCNAME[0]} <infile> <outfile>" >&2
        return 1
    fi

    set -x
    ffmpeg -i $1 -vf "hflip,vflip" $2
    set +x
}
