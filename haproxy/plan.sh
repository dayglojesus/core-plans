pkg_origin=core
pkg_name=haproxy
pkg_description="The Reliable, High Performance TCP/HTTP Load Balancer"
pkg_version=1.6.5
pkg_maintainer='The Habitat Maintainers <humans@habitat.sh>'
pkg_license=('GPL-2.0' 'LGPL-2.1')
pkg_source=http://www.haproxy.org/download/1.6/src/haproxy-1.6.5.tar.gz
pkg_upstream_url="http://git.haproxy.org/git/haproxy-1.6.git/"
pkg_shasum=c4b3fb938874abbbbd52782087117cc2590263af78fdce86d64e4a11acfe85de
pkg_svc_run='haproxy -f config/haproxy.conf -db'
pkg_expose=(8080)
pkg_deps=(core/zlib core/pcre core/openssl)
pkg_build_deps=(
  core/coreutils
  core/gcc
  core/pcre
  core/make
  core/openssl
  core/zlib
)

pkg_bin_dirs=(bin)

do_build() {
  make USE_PCRE=1 \
       USE_PCRE_JIT=1 \
       TARGET=linux2628 \
       USE_OPENSSL=1 \
       USE_ZLIB=1 \
       ADDINC="$CFLAGS" \
       ADDLIB="$LDFLAGS"
}

do_install() {
  mkdir -p "$pkg_prefix"/bin
  cp haproxy "$pkg_prefix"/bin
}
