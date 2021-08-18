# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7..10} )

inherit distutils-r1

DESCRIPTION="Client for reading swedish text tv in the terminal"
HOMEPAGE="https://github.com/voidcase/txtv"
SRC_URI="https://github.com/voidcase/${PN}/archive/refs/tags/v${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/beautifulsoup
	dev-python/requests
	dev-python/colorama"
