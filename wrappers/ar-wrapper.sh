get_dir() {
    target="$1"
    while [ -L "$target" ]; do
        cd "$(dirname "$target")"
        target="$(readlink "$(basename "$target")")"
    done
    cd "$(dirname "$target")"
    pwd
}

DIR="$(get_dir "$0")"
export PATH="$DIR":"$PATH"


llvm-ar --format=coff "$@"
