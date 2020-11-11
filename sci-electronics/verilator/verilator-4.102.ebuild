# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Open-source fast Verilog/SystemVerilog simulator and lint system"
HOMEPAGE="https://www.veripool.org/wiki/verilator"
SRC_URI="https://www.veripool.org/ftp/${PF}.tgz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-lang/perl"
RDEPEND="${DEPEND}"
BDEPEND="sys-devel/autoconf sys-devel/flex sys-devel/bison"
