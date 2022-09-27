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

echo "Installs packages. Give your password when asked."
sudo apt-get install esl-erlang=1:24.3.3-1
sudo apt-get install elixir -y

exec /bin/bash --login
