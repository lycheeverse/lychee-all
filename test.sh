#! /usr/bin/env nix-shell
#! nix-shell -p bash poppler-utils pdftk pandoc csvtk asciidoctor libreoffice -i bash --pure

./lychee files/* --pre ./script.sh --dump
