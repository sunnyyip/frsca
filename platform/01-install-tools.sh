#!/usr/bin/env bash
set -euo pipefail

# Install asdf
ASDF_VERSION=v0.10.2
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch ${ASDF_VERSION}

# Install packages if needed.
case "${PLATFORM}" in

  Darwin)
    echo '. $HOME/.asdf/asdf.sh' >> $HOME/.zshrc
    ;;
    
  Linux)
    echo '. $HOME/.asdf/asdf.sh' >> $HOME/.bashrc
    ;;

  *)
    echo -e "${C_RED}The ${PLATFORM} platform is unimplemented or unsupported.${C_RESET_ALL}"
    exit 1
    ;;

esac 

# Enable asdf
. $HOME/.asdf/asdf.sh
# asdf is installed and avaiable at this point


# Add all plugins based on the local .tool-versions
for p in $(cat .tool-versions | awk '{print $1}');
do
    asdf plugin add $p
done 

# install tool versions based on the local .tool-versions
asdf install
