#!/bin/bash

# Install default programming languages
if [[ -v OMAKUB_FIRST_RUN_LANGUAGES ]]; then
  languages=$OMAKUB_FIRST_RUN_LANGUAGES
  if [[ "$OMAKUB_FIRST_RUN_LANGUAGES" == *"Python"* ]]; then
    python_versions=$OMAKUB_FIRST_RUN_PYTHON_VERSIONS
  fi
else
  AVAILABLE_LANGUAGES=("Ruby on Rails" "Node.js" "Go" "PHP" "Python" "Elixir" "Rust" "Java")
  languages=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --height 10 --header "Select programming languages")

  if [[ "$languages" == *"Python"* ]]; then
    AVAILABLE_PYTHON_VERSIONS=("3.10" "3.11" "3.12" "3.13" "3.14")
    SELECTED_PYTHON_VERSIONS="3.10","3.11","3.12","3.13","3.14"
    python_versions=$(gum choose "${AVAILABLE_PYTHON_VERSIONS[@]}" --no-limit --selected "$SELECTED_PYTHON_VERSIONS" --height 7 --header "Select Python versions")
  fi

fi

if [[ -n "$languages" ]]; then
  for language in $languages; do
    case $language in
    Ruby)
      mise use --global ruby@latest
      mise settings add idiomatic_version_file_enable_tools ruby
      mise x ruby -- gem install rails --no-document
      ;;
    Node.js)
      mise use --global node@lts
      ;;
    Go)
      mise use --global go@latest
      ;;
    PHP)
      sudo apt -y install php php-{curl,apcu,intl,mbstring,opcache,pgsql,mysql,sqlite3,redis,xml,zip} --no-install-recommends
      php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
      php composer-setup.php --quiet && sudo mv composer.phar /usr/local/bin/composer
      rm composer-setup.php
      ;;
    Python)
      sudo add-apt-repository ppa:deadsnakes/ppa -y && sudo apt update
      for version in $python_versions; do
        sudo apt -y install python${version}-venv --no-install-recommends
        python${version} -m ensurepip --upgrade
      done

      gum confirm "Do you want to install uv for Python package management?" && \
      source ~/.local/share/omakub/install/terminal/optional/uv.sh

      gum confirm "Do you want to install venv-cli for Python virtual environment management?" && \
      source ~/.local/share/omakub/install/terminal/optional/venv-cli.sh
      ;;
    Elixir)
      mise use --global erlang@latest
      mise use --global elixir@latest
      mise x elixir -- mix local.hex --force
      ;;
    Rust)
      bash -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)" -- -y
      ;;
    Java)
      mise use --global java@latest
      ;;
    esac
  done
fi
