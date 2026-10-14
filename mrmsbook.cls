\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mrmsbook}[2026/06/14 Mr and little ms]

\pdftrailerid{}
\pdfinfoomitdate=1

\LoadClass[12pt,legalpaper]{book}
\usepackage{pdfpages}
\usepackage[]{geometry}
\geometry{paperwidth=5in, paperheight=11in, margin=0in, nohead}
\usepackage[cam,legal,center]{crop}

\newcommand{\pages}[1]{
    \includepdf[
        pages={#1}, nup=2x1, noautoscale, booklet, landscape
    ]{text.pdf}
}
