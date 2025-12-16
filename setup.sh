#!/usr/bin/env bash

set -euo pipefail

clear

echo "Setting up new server..."

detect_os() {
  if [[ -r /etc/os-release ]]; then
    # shellcheck disable=SC1091
    . /etc/os-release
    local os_id
    os_id="${ID_LIKE:-${ID:-}}"

    case "${os_id,,}" in
      *debian*|*ubuntu*)
        printf 'debian\n'
        return 0
        ;;
      *fedora*|*rhel*|*centos*)
        printf 'fedora\n'
        return 0
        ;;
    esac
  fi

  printf 'unknown\n'
}

install_debian() {
  export DEBIAN_FRONTEND=noninteractive
  apt-get update
  apt-get install -y build-essential wget curl git zip unzip vim net-tools iputils-ping dnsutils netcat-traditional gpg passwd fonts-firacode pkg-config libssl-dev tmux ripgrep sed jq tree btop zsh
}

install_fedora() {
  dnf upgrade -y
  dnf groupinstall -y "Development Tools"
  dnf install -y wget curl git zip unzip vim net-tools iputils bind-utils nmap-ncat gnupg passwd fira-code-fonts pkg-config openssl-devel tmux ripgrep sed jq tree btop zsh
}

main() {
  local detected_os
  detected_os=$(detect_os)

  case "$detected_os" in
    debian)
      install_debian
      ;;
    fedora)
      install_fedora
      ;;
    *)
      echo "OS not detected." >&2
      return 1
      ;;
  esac
}

main "$@"
