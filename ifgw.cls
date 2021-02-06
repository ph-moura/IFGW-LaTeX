\NeedsTeXFormat{LaTeX2e}[1994/06/01]

\ProvidesClass{ifgw}[2021/02/05 v0.0.1 IFGW class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass{book}

\RequirePackage{geometry}

\geometry{%
	top=2cm,
	bottom=2cm,
	right=2cm,
	left=3cm,
	includehead,
	includefoot,
}

\linespread{1.5}
\parindent1.5em

\renewcommand{\chaptermark}[1]{\markboth{\thechapter.~#1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection.~#1}{}}

\renewcommand{\maketitle}{%
	\thispagestyle{empty}
	\begin{center}
		\vfill
		{\Huge\@title}\par
		\vfill
		{\large\@author}\par
	\end{center}
}

\def\ps@headings{%
	\def\@evenhead{\vbox{\thepage\hfill\rightmark\vskip\p@\rule{\textwidth}{\p@}}}
	\def\@oddhead{\vbox{\leftmark\hfill\thepage\vskip\p@\rule{\textwidth}{\p@}}}
	\let\@oddfoot\@empty\let\@evenfoot\@empty
	\let\@mkboth\markboth
}

\def\ps@plain{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@oddhead{{\hfill\thepage}}
    \def\@evenhead{{\thepage\hfill}}
}

\def\ps@myheadings{\ps@plain}

\def\ps@frontheadigs{%
    \let\@oddhead\@empty\let\@evenhead\@empty
    \def\@oddfoot{{\hfil\thepage\hfil}}
    \def\@evenfoot{{\hfil\thepage\hfil}}
}

\let\oldfrontmatter\frontmatter
\renewcommand\frontmatter{\oldfrontmatter\pagestyle{frontheadigs}}
\let\oldmainmatter\mainmatter
\renewcommand\mainmatter{\oldmainmatter\pagestyle{headings}}

\def\@makechapterhead#1{%
	\vspace*{20\p@}
	{\raggedright\huge\scshape\@chapapp~\thechapter}
	\vskip 15\p@
	\begin{flushleft}
		\linespread{1}\selectfont{\sc\huge\bfseries #1\par\nobreak}
	\end{flushleft}
	\vskip 5\p@ \rule{\textwidth}{1.5\p@}\vskip 35\p@
}

\def\@makeschapterhead#1{%
	\vspace*{20\p@}
	\thispagestyle{plain}
	\begin{flushleft}
		\linespread{1}\selectfont{\sc\Huge\bfseries #1\par\nobreak}
	\end{flushleft}
	\vskip 30\p@
}

\newenvironment{abstract}[1][Abstract]{%
	\chapter*{#1}
	\thispagestyle{frontheadigs}
	\addcontentsline{toc}{chapter}{#1}
	\@mkboth{#1}{}
}
{}

\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{\oldtableofcontents\thispagestyle{frontheadigs}}

\newcommand{\bra}[1]{\left\langle#1\right|}
\newcommand{\ket}[1]{\left|#1\right\rangle}
\newcommand{\braket}[3][\@nil]{
	\def\tmp{#1}
	\ifx\tmp\@nnil
		\left\langle#2\middle|#3\right\rangle
	\else
		\left\langle#2\left|#1\right|#3\right\rangle
	\fi
}

\endinput
