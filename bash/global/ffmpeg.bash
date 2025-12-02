ffmpeg_mute() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: ${FUNCNAME[0]} <infile> <outfile>" >&2
        return 1
    fi

    set -x
    ffmpeg -i $1 -c copy -an $2
    set +x
}

ffmpeg_audio_extract_noreencode() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: ${FUNCNAME[0]} <infile> <outfile>" >&2
        echo "To extract without reincoding, the output container must support the codec inside the video"
        echo "e.g., mp4 -> m4a"
        return 1
    fi

    set -x
    ffmpeg -i $1 -vn -acodec copy $2
    set +x
}

ffmpeg_audio_extract_mp3() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: ${FUNCNAME[0]} <infile> <outfile>" >&2
        return 1
    fi

    set -x
    ffmpeg -i $1 -vn -acodec libmp3lame -q:a 2 $2
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
