A collection of ideas, programs and scripts to make [lychee](https://github.com/lycheeverse/lychee/) compatible with additional file formats.

Out of the box lychee supports HTML, Markdown and plain text formats.
More precisely, HTML files are parsed as HTML5 with the use of the [html5ever](https://github.com/servo/html5ever) parser
and Markdown files are treated as [CommonMark](https://commonmark.org/) with the use of [pulldown-cmark](https://github.com/pulldown-cmark/pulldown-cmark/).

For any other file format lychee falls back to a "plain text" mode.
This means that [linkify](https://github.com/robinst/linkify) attempts to extract URLs on a best-effort basis.
If invalid UTF-8 characters are encountered the input file is skipped.
