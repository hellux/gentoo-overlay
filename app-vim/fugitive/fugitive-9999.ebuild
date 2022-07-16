# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

VIM_PLUGIN_VIM_VERSION="8.0"
inherit vim-plugin

if [[ ${PV} == *9999* ]]; then
	EGIT_REPO_URI="https://github.com/tpope/vim-fugitive.git"
	inherit git-r3
else
	SRC_URI="https://github.com/tpope/vim-${PN}/archive/refs/tags/v${PV}.tar.gz -> ${PF}.tar.gz"
	S="${WORKDIR}"
fi

DESCRIPTION="Vim plugin for Git"
HOMEPAGE="https://github.com/tpope/vim-fugitive"
LICENSE="vim"
KEYWORDS="~amd64 ~x86"
