# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	autocfg-1.1.0
	bitflags-1.3.2
	cc-1.0.73
	cfg-if-1.0.0
	clipboard-win-4.4.2
	dirs-4.0.0
	dirs-sys-0.3.7
	errno-0.2.8
	errno-dragonfly-0.1.2
	error-code-2.3.1
	fd-lock-3.0.6
	getrandom-0.2.7
	io-lifetimes-0.7.3
	libc-0.2.134
	linux-raw-sys-0.0.46
	log-0.4.17
	memchr-2.5.0
	nix-0.24.2
	num-bigint-0.4.3
	num-integer-0.1.45
	num-rational-0.4.1
	num-traits-0.2.15
	proc-macro2-1.0.46
	quote-1.0.21
	redox_syscall-0.2.16
	redox_users-0.4.3
	rustix-0.35.11
	rustyline-10.0.0
	rustyline-derive-0.7.0
	scopeguard-1.1.0
	str-buf-1.0.6
	syn-1.0.102
	thiserror-1.0.37
	thiserror-impl-1.0.37
	unicode-ident-1.0.5
	unicode-segmentation-1.10.0
	unicode-width-0.1.10
	utf8parse-0.2.0
	wasi-0.11.0+wasi-snapshot-preview1
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-sys-0.36.1
	windows_aarch64_msvc-0.36.1
	windows_i686_gnu-0.36.1
	windows_i686_msvc-0.36.1
	windows_x86_64_gnu-0.36.1
	windows_x86_64_msvc-0.36.1
"

inherit cargo

DESCRIPTION="An arbitrary bit-width calculator"
HOMEPAGE="https://hllmn.net/projects/hwcalc"
SRC_URI="https://git.sr.ht/~nhellman/${PN}/archive/${PV}.tar.gz
	$(cargo_crate_uris)"

LICENSE="MIT Boost-1.0 Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	cargo_src_install

	doman "docs/man/hc.1"
}
