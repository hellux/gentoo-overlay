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
IUSE="static audio +edit-qt +font +archive"

DEPEND=">=dev-lang/python-3.7
	>=app-arch/zstd-1.3
	>=media-libs/tiff-4.2.0
	>=dev-libs/libsquish-1.15
	>=media-libs/libsamplerate-0.2
	sys-libs/zlib
	audio? (
		>=media-libs/libsamplerate-0.1.9
		>=media-libs/libvorbis-1.3.6
	)
	edit-qt? (
		>=dev-qt/qtcore-5.0
		>=dev-qt/qtwidgets-5.0
		>=dev-qt/qtmultimedia-5.0
	)
	font? ( media-libs/freetype )
	archive? ( app-arch/libarchive )
	"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/${P}-multilib.patch"
	"${FILESDIR}/${P}-include_optional.patch"
)

src_configure() {
	MYCMAKEARGS=(
		"-DINVADER_EDIT_QT=$(usex edit-qt)"
		"-DINVADER_FONT=$(usex font)"
		"-DINVADER_ARCHIVE=$(usex archive)"
		"-DINVADER_USE_AUDIO=$(usex audio)"
		"-DINVADER_STATIC_BUILD=$(usex static)"
	)
	cmake_src_configure
}
