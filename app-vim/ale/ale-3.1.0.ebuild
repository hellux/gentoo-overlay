# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

VIM_PLUGIN_VIM_VERSION="8.0"
inherit vim-plugin

if [[ ${PV} == *9999* ]]; then
	EGIT_REPO_URI="https://github.com/dense-analysis/ale.git"
	inherit git-r3
else
	SRC_URI="https://github.com/dense-analysis/${PN}/archive/v${PV}.tar.gz -> ${PF}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="vim plugin: "
HOMEPAGE="https://github.com/dense-analysis/ale"
LICENSE="BSD-2"
KEYWORDS="~amd64 ~x86"
