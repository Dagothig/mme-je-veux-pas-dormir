\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mrmsbook}[2026/06/14 Mr and little ms]

\year=2026
\month=6
\day=14
\time=600

\pdftrailerid{}
\pdfinfoomitdate=1

\LoadClass[12pt,legalpaper]{book}
\usepackage{pdfpages}
\usepackage[]{geometry}
\geometry{paperwidth=5in, paperheight=11in, margin=0in, nohead}
\usepackage[cam,legal,center]{crop}

\pdfximage{text.pdf}

\newcounter{fourthcover}
\setcounter{fourthcover}{\pdflastximagepages}

\newcounter{thirdcover}
\setcounter{thirdcover}{\value{fourthcover}}
\addtocounter{thirdcover}{-1}

\newcounter{bookletend}
\setcounter{bookletend}{\value{thirdcover}}
\addtocounter{bookletend}{-1}

\newcommand{\pages}[1]{
    \includepdf[
        pages={#1}, nup=2x1, noautoscale, booklet, landscape
    ]{text.pdf}
}

\newcommand{\cover}{\pages{1-2,\arabic{thirdcover}-\arabic{fourthcover}}}
\newcommand{\booklet}{\pages{3-\arabic{bookletend}}}
