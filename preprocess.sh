#!/usr/bin/env bash

case "$1" in
*.pdf)
    exec pdftohtml -i -s -stdout "$1"
    # Alternatives:
    # exec pdftotext "$1" -
    # exec pdftk "$1" output - uncompress | grep -aPo '/URI *\(\K[^)]*'
    ;;
*.odt|*.docx|*.epub|*.ipynb)
    exec pandoc "$1" --to=html --wrap=none --markdown-headings=atx
    ;;
*.odp|*.pptx|*.ods|*.xlsx)
    # libreoffice can't print to stdout unfortunately
    libreoffice --headless --convert-to html "$1" --outdir /tmp
    file=$(basename "$1")
    file="/tmp/${file%.*}.html"
    sed '/<body/,$!d' "$file" # discard content before body which contains libreoffice URLs
    rm "$file"
;;
*.adoc|*.asciidoc)
    asciidoctor -a stylesheet! "$1" -o -
    ;;
*.csv)
    # specify --delimiter if values not delimited by ","
    exec csvtk csv2json "$1"
    ;;
*)
    # identity function, output input without changes
    exec cat
    ;;
esac
