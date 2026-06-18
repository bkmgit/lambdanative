PKGURL=https://ftp.gnu.org/gnu/mpfr/mpfr-4.1.0.tar.bz2
PKGHASH=877d35a8a81a4d2d9446252e9b4ae944754d8ceb

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

package_configure $EXTRACONF --enable-static --disable-shared --with-gmp="$SYS_PREFIX" --prefix="$SYS_PREFIX"

package_make

package_make install

package_cleanup
