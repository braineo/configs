#!/usr/bin/env bash
set -euo pipefail

VERSION="${1:?usage: $0 <major-version|master>}"

if [[ $VERSION == master ]]; then
    BRANCH=master
else
    BRANCH="emacs-$VERSION"
fi

cd emacs
git clean -fdx

if ! git rev-parse --verify --quiet "$BRANCH" >/dev/null \
   && ! git rev-parse --verify --quiet "origin/$BRANCH" >/dev/null; then
    echo "branch $BRANCH not found (available: $(git branch -r --format='%(refname:short)' | grep -E 'origin/(emacs-|master$)' | tr '\n' ' '))"
    exit 1
fi

git checkout "$BRANCH"
git pull --ff-only
./autogen.sh

# Pull version straight from the source so we don't hardcode it.
PKGVERSION=$(grep -oP 'AC_INIT\(\[GNU Emacs\],\s*\[\K[^]]+' configure.ac)
MAJOR=${PKGVERSION%%.*}
PKGNAME="emacs$MAJOR"

BUILD_DIR=../build/emacs$VERSION
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"
rm -rf -- *

# for image support
# sudo apt install libwebp-dev libgif-dev libjpeg-dev libtiff-dev libpng-dev librsvg2-dev

if [[ $VERSION == master ]]; then
    ../../emacs/configure --with-xml2 --with-dbus --with-rsvg --with-modules --with-gnutls --with-imagemagick --with-json \
        --enable-checking='yes,glyphs' --enable-check-lisp-object-type \
        CFLAGS='-O0 -g3'
    make
elif [[ $VERSION == 29 ]]; then
    ../../emacs/configure --with-dbus --with-modules --with-native-compilation=aot --with-json
    make -j"$(nproc)"
elif [[ $VERSION == 30 ]]; then
    ../../emacs/configure --with-rsvg
    make -j"$(nproc)"
else
    ../../emacs/configure --with-dbus --with-modules --with-imagemagick --with-native-compilation --with-native-compilation=aot --with-tree-sitter --with-pgtk
    make -j"$(nproc)" NATIVE_FULL_AOT=1
fi

sudo checkinstall --fstrans=no -pkgversion "$PKGVERSION" -pkgname "$PKGNAME" -y --install=no
