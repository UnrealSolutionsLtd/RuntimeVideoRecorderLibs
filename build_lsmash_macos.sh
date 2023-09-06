#!/bin/sh

CONFIGURE_FLAGS=""

ARCHS="arm64 x86_64"

# directories
SOURCE="l-smash"
FAT="lsmash-mac"

SCRATCH="scratch-lsmash"
# must be an absolute path
THIN=`pwd`/"thin-lsmash"

COMPILE="y"
LIPO="y"

if [ "$*" ]
then
	if [ "$*" = "lipo" ]
	then
		# skip compile
		COMPILE=
	else
		ARCHS="$*"
		if [ $# -eq 1 ]
		then
			# skip lipo
			LIPO=
		fi
	fi
fi

if [ "$COMPILE" ]
then
	CWD=`pwd`
	for ARCH in $ARCHS
	do
		echo "building $ARCH..."
		mkdir -p "$SCRATCH/$ARCH"
		cd "$SCRATCH/$ARCH"
		CFLAGS="-arch $ARCH"
		CXXFLAGS="-mmacosx-version-min=10.15"
		export MACOSX_DEPLOYMENT_TARGET=10.15


		/$CWD/$SOURCE/configure \
		    $CONFIGURE_FLAGS \
		    --target-os="$ARCH"-darwin \
		    --extra-cflags="$CFLAGS" \
		    --extra-ldflags="$LDFLAGS" \
		    --prefix="$THIN/$ARCH" || exit 1

		make -j3 install || exit 1
		cd $CWD
	done
fi

if [ "$LIPO" ]
then
	echo "building fat binaries..."
	mkdir -p $FAT/lib
	set - $ARCHS
	CWD=`pwd`
	cd $THIN/$1/lib
	for LIB in *.a
	do
		cd $CWD
		lipo -create `find $THIN -name $LIB` -output $FAT/lib/$LIB
	done

	cd $CWD
	cp -rf $THIN/$1/include $FAT
fi