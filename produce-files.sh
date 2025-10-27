#! /usr/bin/env nix-shell
#! nix-shell -p bash pandoc texliveSmall -i bash --pure

pandoc -o files/output.pdf input.md
