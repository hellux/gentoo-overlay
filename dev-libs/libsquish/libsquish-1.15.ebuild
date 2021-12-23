# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Image compression library for the DXT standard (S3TC)"
HOMEPAGE="https://sourceforge.net/projects/libsquish/"
SRC_URI="https://sourceforge.net/projects/libsquish/files/libsquish-1.15.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}

src_install() {
	emake install INSTALL_DIR="${D}/usr"
}
