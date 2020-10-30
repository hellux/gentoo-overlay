# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit haskell-cabal

DESCRIPTION="A Vim-like hex editor"
HOMEPAGE="https://github.com/hellux/vhex"

EGIT_REPO_URI="https://github.com/hellux/vhex.git"
inherit git-r3

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-haskell/mtl
	dev-haskell/brick"
RDEPEND="${DEPEND}
	>=dev-haskell/cabal-1.10"
