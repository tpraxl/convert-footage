main() {

	if which tput >/dev/null 2>&1; then
      ncolors=$(tput colors)
  fi
  if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    NORMAL="$(tput sgr0)"
  else
    RED=""
    GREEN=""
    NORMAL=""
  fi

  set -e

  echo "${GREEN}Installing DaVinci Video Converter..."
  echo "${NORMAL}Cloning repository..."
  git clone --depth=1 https://github.com/tpraxl/convert-footage || {
    echo "${RED}Error: git clone of convert-footage repo failed\n"
    exit 1
  }
  echo "${NORMAL}Moving files..."
  sudo cp ./convert-footage/convert-footage /usr/local/bin
  sudo chmod +x /usr/local/bin/convert-footage
  echo "${NORMAL}Cleaning up..."
  rm -rf ./convert-footage
  echo "${GREEN}DaVinci Video Converter has been installed!"
  echo "${GREEN}Use the command \"convert-footage\" to get started."

}

main
