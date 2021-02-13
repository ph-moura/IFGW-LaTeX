\NeedsTeXFormat{LaTeX2e}[1994/06/01]

\ProvidesClass{ifgw}[2021/02/05 v0.0.1 IFGW class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[a4paper, 12pt]{book}

\RequirePackage[T1]{fontenc}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\usepackage{hyperref}
\RequirePackage{setspace}
\RequirePackage{xkeyval}

\geometry{%
	top=3cm,
	bottom=2cm,
	right=2cm,
	left=3cm,
	includehead,
	% includefoot,
}


\AtBeginDocument{
	\def\captionfont{\small}
	\pagestyle{frontheadings}
	% \linespread{1.5}
	% \parindent1.5em
	% \setlength{\parskip}{1em}
	\parindent2em
	\onehalfspacing
}

\renewcommand{\chaptermark}[1]{\markboth{\thechapter.~#1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection.~#1}{}}

\let\oldbibliography\bibliography
\renewcommand{\bibliography}[1]{
	\oldbibliography{#1}
	\addcontentsline{toc}{chapter}{\bfseries\scshape\bibname}
}

\def\cleardoublepage{\clearpage
	\if@twoside
		\ifodd 
			\c@page
		\else
			\vspace*{\fill}
			\thispagestyle{empty}
			\newpage
			\if@twocolumn\hbox{}\newpage\fi
		\fi
	\fi
}

\newcommand{\theyear}{\the\year}

\newcommand{\thetitle}{}
\newcommand{\thesecondarytitle}{}
\renewcommand{\title}[2][]{
	\renewcommand{\thesecondarytitle}{#1}
	\renewcommand{\thetitle}{#2}
}

\newcommand{\thesubtitle}{}
\newcommand{\thesecondarysubtitle}{}
\newcommand{\subtitle}[2][]{%   
	\renewcommand{\thesecondarysubtitle}{#1}
	\renewcommand{\thesubtitle}{#2}
}

\newcommand{\theauthor}{}
\let\oldauthor\author
\renewcommand{\author}[1]{%
	\oldauthor{#1}%
	\renewcommand{\theauthor}{#1}
}

\newcommand{\theinstitute}{}
\newcommand{\thesecondaryinstitute}{}
\newcommand{\institute}[2][]{%
	\renewcommand{\theinstitute}{#2}
	\renewcommand{\thesecondaryinstitute}{#1}
}

\newcommand{\theuniversity}{}
\newcommand{\thesecondaryuniversity}{}
\newcommand{\university}[2][]{%
	\renewcommand{\theuniversity}{#2}
	\renewcommand{\thesecondaryuniversity}{#1}
}

\newcommand{\thesupervisor}{}
\newcommand{\supervisorname}{Supervisor}
\newcommand{\supervisor}[2][Supervisor]{%
	\renewcommand{\supervisorname}{#1}
	\renewcommand{\thesupervisor}{#2}
}

\newcommand{\thecosupervisor}{}
\newcommand{\cosupervisorname}{}
\newcommand{\cosupervisor}[2][Co-supervisor]{%
	\renewcommand{\cosupervisorname}{#1}
	\renewcommand{\thecosupervisor}{#2}
}

\newcommand{\thecity}{}
\newcommand{\city}[1]{%
	\renewcommand{\thecity}{#1}
}

\def\logo@align@center{center}
\def\logo@align@left{flushleft}
\def\logo@align@right{flushright}
\newlength{\logo@width}

\define@key{logo}{width}[2cm]{\setlength\logo@width{#1}}
\define@key{logo}{align}{\def\logo@align{\csname logo@align@#1\endcsname}}
\setkeys{logo}{align=left, width=1.5cm}

\newcommand{\thelogo}{}
\newcommand{\logo}[2][]{
	\setkeys{logo}{#1}
	\renewcommand{\thelogo}{\includegraphics[width=\logo@width]{#2}}
}

\def\page@logo{
	\if\thelogo\@empty\relax
	\else
		\begin{\logo@align}
			\thelogo
		\end{\logo@align}
	\fi
}

\def\page@title{
	\ifx\thetitle\@empty\relax
	\else
		\if\thesubtitle\@empty\relax
			\MakeUppercase{\thetitle}
		\else
			{\MakeUppercase{\thetitle}:\\\thesubtitle}
		\fi
		\vfill
	\fi
	\if\thesecondarytitle\@empty\relax
	\else
		\if\thesecondarysubtitle\@empty\relax
			\MakeUppercase{\thesecondarytitle}
		\else
			{\MakeUppercase{\thesecondarytitle}:\\\thesecondarysubtitle}
		\fi
		\vfill
	\fi
	\vfill
}

\def\page@institution{
	\if\theuniversity\@empty\relax
	\else
		\if\theinstitute\@empty\relax
			{\MakeUppercase{\theuniversity}}
		\else
			{\MakeUppercase{\theuniversity}\\\theinstitute}
		\fi
		\vfill
	\fi 
}

\def\page@author{
	\if\theauthor\@empty\relax
	\else
		\MakeUppercase{\theauthor}
		\vfill
	\fi
}

\def\page@city{
\if\thecity\@empty\relax
	\else
		\MakeUppercase{\thecity\\\the\year}
	\fi
}

\define@key{backcover}{first language}{\def\backcover@first@language{#1}}
\define@key{backcover}{second language}{\def\backcover@second@language{#1}}
\define@key{backcover}{version text}{\def\backcover@version@text{#1}}

\setkeys{backcover}{	
	first language=\@empty, 
	second language=\@empty, 
	version text=\@empty
}

\newcommand{\backcover}[1]{
	\setkeys{backcover}{#1}
}

\def\page@text{
	\hspace*{7.5cm}
	\begin{minipage}{8.5cm}
		\singlespacing
		\if\backcover@first@language\@empty
			\relax
		\else
			\backcover@first@language
			\vskip\baselineskip
		\fi
		\if\backcover@second@language\@empty
			\relax
		\else
			\backcover@second@language
		\fi
	\end{minipage}
	\vfill
}

\def\page@version@text{
	\begin{minipage}{8.5cm}
		\singlespacing
		\if\backcover@version@text\@empty\relax
		\else
		\MakeUppercase{\backcover@version@text}
		\fi
	\end{minipage}
	\vfill
}

\def\page@supervisor{
	\if\thesupervisor\@empty\relax
	\else
		{\supervisorname:~\MakeUppercase{\thesupervisor\relax}}\\
	\fi
	\if\thecosupervisor\@empty\relax
	\else
		{\cosupervisorname:~\MakeUppercase{\thecosupervisor\relax}}\\
	\fi
}

\renewcommand{\maketitle}{%
	\thispagestyle{empty}
	\page@logo
	\begin{center}
		\page@institution
		\page@author
		\page@title	
		\vfill
		\page@city	
	\end{center}
	\newpage
}

\newcommand{\makebackcover}{
	\cleardoublepage
	\thispagestyle{empty}
	\begin{center}
		\page@author
		\page@title	
		\page@text
	\end{center}
	\page@supervisor
	\page@version@text
	\begin{center}
		\page@city	
	\end{center}
	\newpage
}

\def\ps@headings{%
	\def\@evenhead{\vbox{\thepage\hfill\rightmark\vskip.75\p@\hrule\relax}}
	\def\@oddhead{\vbox{\leftmark\hfill\thepage\vskip.75\p@\hrule\relax}}
	\let\@oddfoot\@empty\let\@evenfoot\@empty
	\let\@mkboth\markboth
}

\def\ps@plain{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@oddhead{{\hfill\thepage}}
    \def\@evenhead{{\thepage\hfill}}
}

\def\ps@myheadings{\ps@headings}

\def\ps@frontheadings{%
    \let\@oddhead\@empty\let\@evenhead\@empty
    \def\@oddfoot{{\hfil\thepage\hfil}}
    \def\@evenfoot{{\hfil\thepage\hfil}}
}

\def\ps@frontheadings{\ps@empty}

\let\oldfrontmatter\frontmatter
\renewcommand\frontmatter{\oldfrontmatter\pagestyle{frontheadings}}
\let\oldmainmatter\mainmatter
\renewcommand\mainmatter{\oldmainmatter\pagestyle{headings}}

\renewcommand\chapter{%
	\@ifstar\ifgw@chapter@star\ifgw@chapter
}

\newlength{\chapterrulewidth}
\setlength{\chapterrulewidth}{1.5\p@}

\newcommand{\ifgw@chapter}[2][]{
	\cleardoublepage
	\pagestyle{headings}
	\thispagestyle{plain}
	\refstepcounter{chapter}
	\def\chtext{#1}
	\ifx\chtext\@empty\relax\renewcommand{\chtext}{#2}\fi
	\addcontentsline{toc}{chapter}{\sc\bfseries\thechapter.~#2}
	\@mkboth{\thechapter.~\chtext}{}
	\begingroup
		% \vspace*{20\p@}
		\selectfont\huge\scshape\noindent\@chapapp~\thechapter
		\vskip\baselineskip
		\linespread{1.5}\noindent{\bfseries#2}
		\vskip5\p@
		\noindent\rule{\textwidth}{\chapterrulewidth}
	\endgroup
	\vskip 30\p@
	\par
}

\newcounter{chapterstar}
\newcommand\ifgw@chapter@star[1]{
	\cleardoublepage
	\@mkboth{}{}
	\thispagestyle{frontheadings}
	\begingroup
		% \vspace*{20\p@}
		\selectfont\huge\bfseries\scshape
		\linespread{1.5}\noindent#1
	\endgroup
	\refstepcounter{chapterstar}
	\vskip 30\p@
	\par
}

\define@key{abstract}{header}{\def\abstract@header{#1}}
\define@key{abstract}{name}{\def\abstract@name{#1}}
\setkeys{abstract}{name=Abstract, header=\@empty}

\newenvironment{abstract}[1][]{%
	\setkeys{abstract}{#1}
	\chapter*{\abstract@name}
	\thispagestyle{frontheadings}
	\addcontentsline{toc}{chapter}{\bfseries\scshape\abstract@name}
	\@mkboth{\abstract@name}{}
	\if\abstract@header\@empty
		\relax
	\else
		{\singlespacing\noindent\abstract@header}
	\fi
	\noindent\break
}
	\onehalfspacing
{\newpage}

\newcommand{\epigraph}[2]{
	\cleardoublepage
	\vspace*{\fill}
	\begin{flushright}
		\begin{minipage}{8.5cm}
			{\it``#2''}\\
			{\hspace*{\fill}\it#1}
		\end{minipage}
	\end{flushright}
	\break\newpage
}

\newcommand{\dedication}[1]{
	\cleardoublepage
	\vspace*{\fill}
	\begin{flushright}
		\begin{minipage}{7cm}
			{\it#1}
		\end{minipage}
	\end{flushright}
	\pagebreak
}

\newcommand{\bra}[1]{\left\langle#1\right|}
\newcommand{\ket}[1]{\left|#1\right\rangle}
\newcommand{\braket}[3][]{
	\def\tmp{#1}
	\ifx\tmp\@empty\relax
		\left\langle#2\middle|#3\right\rangle
	\else
		\left\langle#2\middle|#1\middle|#3\right\rangle
	\fi
}

\endinput
