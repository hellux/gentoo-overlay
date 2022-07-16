# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="CLI YouTube frontend"
HOMEPAGE="https://github.com/hellux/ytrecent"

EGIT_REPO_URI="https://github.com/hellux/ytrecent.git"
inherit git-r3

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="net-misc/curl sys-apps/util-linux app-misc/jq"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	default_src_install
	mv ytr.sh ytr
	dobin ytr
}
