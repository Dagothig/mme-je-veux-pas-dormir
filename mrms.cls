\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mrms}[2026/06/14 Mr and little ms]

\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=mrms, prefix=mrms@}
\DeclareStringOption[<TITLE>]{title}
\DeclareStringOption[<NAME>]{name}
\DeclareStringOption[0.5]{r}
\DeclareStringOption[0.5]{g}
\DeclareStringOption[0.5]{b}
\ProcessKeyvalOptions*

\LoadClass[12pt,twoside]{book}

\usepackage{tikz}
\usetikzlibrary{shapes.misc, positioning}
\usepackage[
    paperwidth=5.625in, paperheight=5.25in,
    margin=0.5in, outer=0.625in
]{geometry}
\usepackage{layout}
\usepackage[dvipsnames]{xcolor}
\usepackage{multicol}
\usepackage{enumitem}
\usepackage{setspace}
\usepackage{tgadventor}
\usepackage{ifthen}
\renewcommand*\familydefault{\sfdefault}
\usepackage[T1]{fontenc}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\setstretch{1.0}
\definecolor{primary}{rgb}{\mrms@r, \mrms@g, \mrms@b}
\hyphenpenalty=10000

\newcommand{\ifmr}[2]{\ifthenelse{\equal{\mrms@title}{Monsieur}}{#1}{#2}}

\newcommand{\coverpage}[1]{
    \large
    \begin{tikzpicture}[remember picture,overlay]
    \node[xshift=0.125in, yshift=-0.25in](img) at (current page.center){\includegraphics[width=4.5in,height=4in,keepaspectratio]{#1}};
    \fill[primary] (current page.north west) -- +(0.3in, 0.0in) -- +(0.3in, -\paperheight) -- (current page.south west);
    \node[xshift=0.3in-5pt, yshift=0.25in, rotate=90, right] at (current page.south west){
        \textcolor{white}{\ifmr{\textbf{MONSIEUR} MADAME}{MONSIEUR \textbf{MADAME}}\hspace{1.575in}\textbf{DAGOTHIG}}
    };
    \node[xshift=0.125in, yshift=-9pt-0.375in](name) at (current page.north){
        \textcolor{primary}{\huge\ifmr{\textbf{M.}}{\textbf{M}ME.} \textbf{\uppercase{\mrms@name}}}
    };
    \node[text width=40pt, xshift=-56pt, yshift=0.375in](jeunesse) at (current page.south east){
        \fontsize{8pt}{8pt}\selectfont JEUNESSE
    };
    \node[text width=40pt, above of=jeunesse, yshift=-18pt](diroum){
        \fontsize{14pt}{14pt}\selectfont diroum
    };
    \end{tikzpicture}
    \newpage
    \normalsize
}

\newcommand{\collectionpage}[0]{
    %collection + légal
    COLLECTION\break «TWADO»\break
    \textbf{Titres parus :}\break
    {\small
    \begin{multicols}{2}
        \begin{enumerate}[label=,leftmargin=0pt]
            \item Madame JE-VEUX-PAS-DORMIR
            \item Madame GOBELIN
            \item Madame NATA
            \item Madame FIN-DE-PHRASE
            \item Monsieur LETTE
            \item Monsieur GABOUÉ
            \columnbreak
            \item Monsieur JE-SUIS-PAS-FATIGUÉ
            \item Monsieur BABA
            \item Monsieur ÇA-FAIT-LA-JOB
            \item Monsieur ARRÊTER-QUAND-JE-VEUX
            \item Monsieur TWADO
            \item Monsieur MÉDIOCRE
        \end{enumerate}
    \end{multicols}
    }
    \vfill
    \center
    \scriptsize\textbf{Mr. Men} and \textbf{Little Miss}\texttrademark \space \& \textcopyright 1984, The Hargreaves Organisation. Tous droits réservés.
    \break
    \scriptsize\textit{\mrms@title\space\mrms@name} \textcopyright\space 2026 diroum JEUNESSE (une société de Twado). Peu de droits réservés.
    \newpage
    \raggedright\normalsize
}

\renewcommand{\titlepage}[0]{
    %titre
    \center
    \null\vfill
    \huge\textbf{\mrms@title\\\uppercase{\mrms@name}\\}
    \vspace{\baselineskip}
    \Large\textit{\textrm{dagothig}}\\
    \vfill
    \begin{tikzpicture}
    \fontsize{8pt}{8pt}\selectfont \node[text width=40pt](jeunesse){JEUNESSE};
    \fontsize{14pt}{14pt}\selectfont \node[text width=40pt, above of=jeunesse, yshift=-18pt](diroum){diroum};
    \end{tikzpicture}

    \newpage
    \raggedright\normalsize
}

\newcommand{\imgpage}[1]{
    \tikz[remember picture,overlay]
    \node[inner sep=0pt] at (current page.center){
        \includegraphics[width=5.625in,height=5.25in]{#1}
    };
    \newpage
}

\newcommand{\txtpage}[1]{
    \newgeometry{
        hmargin=0.5in,
        vmargin=0.0in,
        outer=0.625in}
    \null\vfill
    \begin{minipage}{\textwidth}
        \setstretch{1.5}
        \setlength{\parskip}{12pt}
        #1
    \end{minipage}
    \vfill
    \restoregeometry
    \newpage
}

\newcommand{\emptypage}[0]{
    \hspace{0pt}
    \newpage
}

\newcommand{\mrms}[3]{
    \begin{tikzpicture}
        \node[](pic){\includegraphics[width=0.75in,height=0.75in,keepaspectratio]{#3}};
        \node[below of=pic, yshift=-2pt](title){\scriptsize{#1}};
        \node[below of=pic, yshift=-11pt](txt){\scriptsize{#2}};
    \end{tikzpicture}
}

\newcommand{\legalpage}[0]{
    %légal (kwe?)

    \hspace{0pt}\vfill
    \center\footnotesize
    \begin{tikzpicture}
        \node[rounded rectangle, text width=140pt, fill=black, align=center](lien){
            \textcolor{white}{Retrouve tous tes héros sur \textbf{https://twado.neocities.org/}}
        };
    \end{tikzpicture}

    \vspace{12pt}\scriptsize
    Édité par diroum JEUNESSE, 2920, chemin de la tour, Montréal.\break
    Pas de dépôt légal: 2 juin 2026\break
    Définitivement hors la loi sur les publications destinées à la jeunesse.\break
    Achevé d'imprimer par Myriam à Montréal.
    \newpage
    \normalsize
}

\newcommand{\backpage}[0]{
    \begin{tikzpicture}[remember picture,overlay]
    \fill[primary] (current page.north east) -- +(-0.3in, 0.0in) -- +(-0.3in, -\paperheight) -- (current page.south east);
    \node[xshift=-0.125in](gowee) at (current page.center){
        \setlength{\tabcolsep}{0pt}
        \begin{tabular} { c c c c c }
            \mrms{Madame}{JE-VEUX-PAS-DORMIR}{../img/mme-je-veux-pas-dormir.jpg} &
            \mrms{Madame}{GOBELIN}{../img/mme-gobelin.jpg} &
            \mrms{Madame}{NATA}{../img/mme-nata.jpg} &
            \mrms{Madame}{FIN-DE-PHRASE}{../img/mme-fin-de-phrase.jpg} \\
            \mrms{Monsieur}{LETTE}{../img/cossin.jpg} &
            \mrms{Monsieur}{GABOUÉ}{../img/d-gaboue.jpg} &
            \mrms{Monsieur}{JE-SUIS-PAS-FATIGUÉ}{../img/m-je-suis-pas-fatigue.jpg} &
            \mrms{Monsieur}{BABA}{../img/m-baba.jpg} \\
            \mrms{Monsieur}{ÇA-FAIT-LA-JOB}{../img/m-ca-fait-la-job.jpg} &
            \mrms{Monsieur}{ARRÊTER-QUAND-JE-VEUX}{../img/m-arreter-quand-je-veux.jpg} &
            \mrms{Monsieur}{TWADO}{../img/m-twado.jpg} &
            \mrms{Monsieur}{MÉDIOCRE}{../img/barnak.jpg}
        \end{tabular}
    };
    \node[above of=gowee, yshift=1.5in](title){\textbf{COLLECTION «TWADO»}};
    \end{tikzpicture}
    \newpage
}

\title{\mrms@title\space\mrms@name}
\author{Guillaume Noël-Martel}
\date{\today}
\raggedright
\pagenumbering{gobble}
