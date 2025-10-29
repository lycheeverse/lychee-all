#! /usr/bin/env nix-shell
#! nix-shell -p bash pandoc texliveSmall -i bash --pure

pandoc -o files/output.pdf input.md

pandoc -o files/output.odt input.md
pandoc -o files/output.docx input.md

pandoc -o files/output.pptx input.md
# odp not supported by pandoc

# xlsx not supported by pandoc
# ods not supported by pandoc

pandoc -o files/output.epub input.md
pandoc -o files/output.ipynb input.md
