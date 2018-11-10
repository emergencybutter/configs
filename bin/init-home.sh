#!/bin/bash

set -e

if [[ ! -e _zshrc ]] ; then
	echo "Run from configs/ directory."
	exit 1
fi

mkdir -p ~/.zsh/functions ~/.vim

CONFIGS=$(pwd -P)
find . -type f -not -path '*/\.*' | while read p ; do
	p=${p:2}
	dotp=${p/_/.}
	echo $dotp
	(cd && ln -sf ${CONFIGS}/${p} ${dotp})
done
