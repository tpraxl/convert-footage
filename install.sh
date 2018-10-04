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

  # Exit when a command fails
  set -o errexit

  URL="https://raw.githubusercontent.com/tpraxl/convert-footage/master/convert-footage"

  echo "${GREEN}Installing convert-footage..."
  echo "${NORMAL}Downloading file..."

  # We download file before asking for permissions so we aren't using sudo with curl/wget.
  
  # Check if curl is installed
  if command -v curl >/dev/null 2>&1; then
    curl $URL >> ./convert-footage-tmp
  else 
    # Check if wget is installed
    if command -v wget >/dev/null 2>&1; then
      wget $URL -O ./convert-footage-tmp -q --show-progress
    else
      echo "${RED}Error: Please install either wget or curl before running this script."
      exit 1
    fi
  fi

  echo "${NORMAL}Moving file..."
  sudo cp ./convert-footage-tmp /usr/local/bin/convert-footage
  sudo chmod +x /usr/local/bin/convert-footage
  echo "${NORMAL}Cleaning up..."
  rm ./convert-footage-tmp
  echo "${GREEN}convert-footage has been installed!"
  echo "${GREEN}Use the command \"convert-footage\" to get started."

}

main
