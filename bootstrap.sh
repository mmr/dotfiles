#!/bin/bash -e
# this script requires root, run like this
# wget -O- https://raw.github.com/mmr/dotfiles/master/bootstrap.sh | sudo bash

# Required apps
REQ_APPS="wget git"

check_root() {
  if [[ $EUID -eq 0 ]]; then
    return
  fi 

  echo "This script must be run as root" 1>&2
  exit 1
}

install_req_apps() {
  echo "Installing $REQ_APPS..."
  apt-get update -yq
  apt-get install -yq $REQ_APPS
}

install_salt() {
  echo "Installing SaltStack..."

  # Checking if already installed
  if which salt-call; then
    echo "Salt already installed"
    return
  fi

  # Installing
  wget -O- http://bootstrap.saltstack.org | bash

  # Making sure we are masterless
  echo 'file_client: local' > /etc/salt/minion
}

salt_it_up() {
  echo "Starting provisioning with Salt..."
  git clone git://github.com/mmr/dotfiles.git /srv/salt
  salt-call state.highstate
}

# ===
# Party starts here

check_root
install_req_apps
install_salt
salt_it_up
