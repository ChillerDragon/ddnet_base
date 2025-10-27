#!/bin/bash

set -euo pipefail

log() {
	printf '[*] %s\n' "$1"
}

if [ ! -f scripts/update.sh ]
then
	echo "wrong working directory"
	exit 1
fi

if [ "$(basename "$PWD")" != ddnet_base ]
then
	echo "wrong working directory"
	exit 1
fi

if ! OLD_SRC="$(mktemp -d /tmp/old_src_XXXXX)"
then
	exit 1
fi

log "backing up old code to $OLD_SRC .."
mv src/ "$OLD_SRC"

mkdir -p src/ddnet_base
cp -r ../ddnet/src/base src/ddnet_base

mkdir -p src/ddnet_base/engine/external
cp -r ../ddnet/src/engine/external/md5 src/ddnet_base/engine/external
cp ../ddnet/src/engine/external/{.clang-tidy,.clang-format,important.txt} src/ddnet_base/engine/external
