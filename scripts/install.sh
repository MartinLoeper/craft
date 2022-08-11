#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Installing craft using composer..."
(cd "$DIR/.." && composer install)

# see: https://craftcms.com/docs/3.x/installation.html#step-2-set-the-file-permissions
echo "Setting correct permissions..."
(cd "$DIR/.." && sudo chmod -Rf 0777 .env composer.json composer.lock config/* config storage/* vendor web/cpresources/)

echo "Run the craft setup..."
(cd "$DIR/.." && php craft setup)

echo "Now you can run docker-compose up!"