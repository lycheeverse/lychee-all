#! /usr/bin/env nix-shell
#! nix-shell -p bash poppler-utils pdftk pandoc csvtk asciidoctor libreoffice -i bash --pure

set -euo pipefail

log_failure() {
  printf "✖ %s\n" "$@" >&2
}

# Source: https://github.com/torokmark/assert.sh/blob/main/assert.sh
assert_eq() {
  local expected="$1"
  local actual="$2"
  local msg="${3-}"

  if [ "$expected" == "$actual" ]; then
    return 0
  else
    [ "${#msg}" -gt 0 ] && log_failure "$expected == $actual :: $msg" || true
    exit 1
  fi
}


declare -a files=(
"asciidoc.adoc"
"example.csv"
"example.odp"
"example.ods"
"example.xlsx"
"output.docx"
"output.epub"
"output.ipynb"
"output.odt"
"output.pdf"
"output.pptx"
)

for file in "${files[@]}"
do
  urls=$(./lychee "files/$file" --preprocess ./preprocess.sh --dump)
  echo "$urls"
  count=$(echo "$urls" | wc -l)
  assert_eq "$count" "3" "Expected 3 links from "$file""
done
