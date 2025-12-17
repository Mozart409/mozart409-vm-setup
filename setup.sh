#!/bin/bash

set -euo pipefail

echo "Setting up new server..."

detect_os() {
	if [[ -r /etc/os-release ]]; then
		# shellcheck disable=SC1091
		. /etc/os-release
		local os_id
		os_id="${ID_LIKE:-${ID:-}}"

		case "${os_id,,}" in
		*debian* | *ubuntu*)
			printf 'debian\n'
			return 0
			;;
		*fedora* | *rhel* | *centos*)
			printf 'fedora\n'
			return 0
			;;
		esac
	fi

	printf 'unknown\n'
}

install_rust() {
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
	export PATH="$HOME/.cargo/bin:$PATH"
	rustup default nightly
}

install_debian() {
	export DEBIAN_FRONTEND=noninteractive
	apt-get update
	apt-get install -y build-essential wget curl git zip unzip vim net-tools iputils-ping dnsutils netcat-traditional gpg passwd fonts-firacode pkg-config libssl-dev tmux ripgrep sed jq tree btop zsh nodejs lua5.4 luarocks python3 ninja-build gettext cmake zsh
}

install_fedora() {
	dnf update -y
	dnf install -y wget curl git zip unzip vim net-tools iputils bind-utils nmap-ncat gnupg passwd fira-code-fonts pkg-config openssl-devel tmux ripgrep sed jq tree btop zsh nodejs lua luarocks python3 ninja-build cmake gcc gcc-c++ make zsh
	dnf copr enable agriffis/neovim-nightly
	dnf install -y neovim python3-neovim
}

setup_tmux() {
	git clone https://github.com/a-mader/mozart409-tmux.git "$HOME/.config/tmux"
	git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
}

build_neovim() {
	git clone https://github.com/neovim/neovim /tmp/neovim
	cd /tmp/neovim
	git checkout stable
	make CMAKE_BUILD_TYPE=RelWithDebInfo
	cd build
	cpack -G DEB
	dpkg -i nvim-linux-*.deb
	cd /
	rm -rf /tmp/neovim
}
setup_neovim() {
	git clone https://github.com/a-mader/mozart409-nvim.git ~/.config/nvim
}

setup_zsh() {
	wget -O ~/.zshrc https://raw.githubusercontent.com/Mozart409/mozart409-vm-setup/refs/heads/main/zsh/zshrc
	curl -s https://ohmyposh.dev/install.sh | bash -s
	exec zsh

	oh-my-posh font install iosevka
}

main() {
	local detected_os
	detected_os=$(detect_os)

	case "$detected_os" in
	debian)
		install_debian
		install_rust
		setup_tmux
		build_neovim
		setup_neovim
		setup_zsh
		;;
	fedora)
		install_fedora
		install_rust
		setup_tmux
		setup_neovim
		setup_zsh
		;;
	*)
		echo "OS not detected." >&2
		return 1
		;;
	esac
}

main "$@"
