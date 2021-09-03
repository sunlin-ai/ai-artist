#!/bin/sh

git clone https://github.com/pollinations/pollinations.git
cd pollinations/app
git pull
git checkout dev
git pull
npm run install_backend
cd -

DEBUG=* node pollinate --send --once --path ./Text-To-Image
