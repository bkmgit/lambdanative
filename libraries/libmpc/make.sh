PKGURL=https://ftp.gnu.org/gnu/mpc/mpc-1.2.1.tar.gz
PKGHASH=2a4919abf445c6eda4e120cd669b8733ce337227

package_download $PKGURL $PKGHASH

case $SYS_PLATFORM in
ios)
  EXTRACONF=--host=arm
;;
android|bb10|playbook)
  EXTRACONF=--host=arm-eabi
;;
win32*)
  EXTRACONF=--host=i386-mingw32
;;
linux*)
  EXTRACONF="--host=i386-linux"
;;
openwrt)
  EXTRACONF=--host=$SYS_OPENWRTTARGET
;;
sitara|carlson-minot)
  EXTRACONF=--host=arm
;;
*)
  EXTRACONF=
;;
esac

package_configure $EXTRACONF --disable-shared --enable-static --with-gmp="$SYS_PREFIX" --with-mpfr="$SYS_PREFIX" --prefix="$SYS_PREFIX"

package_make

package_make install

package_cleanup
