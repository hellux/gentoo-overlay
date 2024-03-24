# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Halo: Combat Evolved maps and assets toolkit"
HOMEPAGE="https://github.com/SnowyMouse/invader"
SRC_URI="https://github.com/SnowyMouse/${PN}/archive/refs/tags/${PV}.tar.gz -> ${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-lang/python-3.7
	>=app-arch/zstd-1.3
	>=media-libs/tiff-4.2.0
	>=dev-libs/libsquish-1.15
	>=media-libs/libsamplerate-0.2
	sys-libs/zlib
	>=media-libs/libsamplerate-0.1.9
	>=media-libs/libvorbis-1.3.6
	>=dev-qt/qtbase-6.6.2
	media-libs/freetype
	app-arch/libarchive
	>=dev-build/cmake-3.14[qt6]
	"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/${P}-multilib.patch"
	"${FILESDIR}/${P}-optional_deps.patch"
)

src_configure() {
	local mycmakeargs=(
		"-DINVADER_SCRIPT=no"
	)
	cmake_src_configure
}
