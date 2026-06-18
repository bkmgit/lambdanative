PKGURL=https://ftp.gnu.org/gnu/gmp/gmp-6.2.1.tar.bz2
PKGHASH=2dcf34d4a432dbe6cce1475a835d20fe44f75822

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

package_configure $EXTRACONF --disable-static --enable-shared --prefix="$SYS_PREFIX"

package_make

package_make install

package_cleanup
