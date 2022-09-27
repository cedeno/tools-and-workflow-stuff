#!/bin/bash

if
	  [[ "${USER:-}" == "root" ]]
  then
	    echo "This script works only with normal user, it wont work with root, please log in as normal user and try again." >&2
	      exit 1
fi

set -e

echo "Updates packages. Asks for your password."
sudo apt-get update -y

echo "Fetching Erlang & Elixir Deps"
wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && sudo dpkg -i erlang-solutions_2.0_all.deb
sudo apt-get update -y
rm -fr erlang-solutions*

echo "Installs packages. Give your password when asked."
sudo apt-get install esl-erlang=1:24.3.3-1
sudo apt-get install elixir -y

echo "Install Hex, Elixir package manager"
mix local.hex --force

exec /bin/bash --login
