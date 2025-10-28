A collection of ideas, programs and scripts to make [lychee](https://github.com/lycheeverse/lychee/) compatible with additional file formats.

Out of the box lychee supports HTML, Markdown and plain text formats.
More precisely, HTML files are parsed as HTML5 with the use of the [html5ever](https://github.com/servo/html5ever) parser
and Markdown files are treated as [CommonMark](https://commonmark.org/) with the use of [pulldown-cmark](https://github.com/pulldown-cmark/pulldown-cmark/).

For any other file format lychee falls back to a "plain text" mode.
This means that [linkify](https://github.com/robinst/linkify) attempts to extract URLs on a best-effort basis.
If invalid UTF-8 characters are encountered the input file is skipped.

# Converting file formats

## epub, odt, docx, ipynb

```bash
pandoc files/output.docx --to=html --wrap=none --markdown-headings=atx
```

## PDF

### poppler-utils

Using poppler-utils we can convert PDFs to text or HTML:

```bash
pdftotext "$1" -
pdftohtml -s "$1" -stdout
```

### pdftk

Alternatively, pdftk can be used to extract URI directives from PDFs.
Source: https://unix.stackexchange.com/a/531883

```bash
pdftk "$1" output - uncompress | grep -aPo '/URI *\(\K[^)]*'
```

## CSV

Although, CSV seems like a simple data format lychee cannot understand value separators.

```
url,name
https://github.com/lycheeverse/lychee,Hello there
```

In the above example lychee might mistakingly detect `https://github.com/lycheeverse/lychee,Hello` as a URL.
CSV separators can be customised and there is no way for lychee to know what separators are used.
Because of that, it's the user's responsibility to transform CSV into a format lychee can understand.

### csvtk

[csvtk](https://github.com/shenwei356/csvtk) is a toolkit to work with CSV data.
Apart from many advanced features, it allows us to convert and pretty-print CSV.
One possible way to transform the data is:

```bash
csvtk csv2json "$1"
```
