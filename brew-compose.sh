#!/bin/sh

RUBY_EXE=''
if command -v ruby >/dev/null && ruby -e 'exit RUBY_VERSION.split(".").first(2).join(".").to_f >= 2.3'; then
  RUBY_EXE=ruby
else
  brew_path=$(command -v brew)
  if [ $? = 0 ]; then
    portable_ruby="$(dirname $(dirname $brew_path))/Homebrew/Library/Homebrew/vendor/portable-ruby/current/bin/ruby"
    if [ -f $poratable_ruby ]; then
      RUBY_EXE="$portable_ruby"
    fi
  fi
fi

if [ -z $RUBY_EXE ]; then
  if [ $(uname) = Linux ]; then
    brew_website="Linuxbrew at https://linuxbrew.sh"
  else
    brew_website="Homebrew at https://brew.sh"
  fi
  echo >&2 "Could not find ruby (version >= 2.3) executable.\nPlease install $brew_website first."
  return
fi

exec "$RUBY_EXE" "$(dirname $0)/brew-compose" "$@"
