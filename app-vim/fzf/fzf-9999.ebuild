# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

VIM_PLUGIN_VIM_VERSION="8.0"
inherit vim-plugin

EGIT_REPO_URI="https://github.com/junegunn/fzf.vim.git"
inherit git-r3

DESCRIPTION="Bundle of useful commands using fzf for Vim"
HOMEPAGE="https://github.com/junegunn/fzf.vim"
LICENSE="MIT"
KEYWORDS="~amd64"

DEPEND=">=app-shells/fzf-0.30"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure () {
	# avoid file collision with fzf.vim from app-shell/fzf
	mv plugin/fzf.vim plugin/fzf_vim.vim
	# avoid E746, function/file name mismatch
	sed -i 's/fzf#complete/fzf_vim#complete/' plugin/fzf_vim.vim
}
