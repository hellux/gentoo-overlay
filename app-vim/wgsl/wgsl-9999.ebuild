# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

VIM_PLUGIN_VIM_VERSION="9.0"
inherit vim-plugin

EGIT_REPO_URI="https://github.com/DingDean/${PN}.vim.git"
inherit git-r3

DESCRIPTION="vim plugin: WGSL syntax highlight for vim"
HOMEPAGE="https://github.com/DingDean/wgsl.vim"
LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

VIM_PLUGIN_HELPFILES=""
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""
