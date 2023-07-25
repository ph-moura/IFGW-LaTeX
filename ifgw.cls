%% ifgw.cls
%% Copyright 2021 Paulo Henrique De Moura
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Paulo Henrique De Moura
%
% This work consists of the files ifgw.cls and main.tex
%% Copyright 2005 Paulo Henrique De Moura
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Paulo Henrique De Moura.
%
% This work consists of the files ifgw.cls and main.tex.
%
\NeedsTeXFormat{LaTeX2e}[1994/06/01]

\ProvidesClass{ifgw}[2021/02/05 v0.0.1 IFGW class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[a4paper, oneside, 12pt]{book}

%>>>=============== Required Packages ===================>>>
\RequirePackage[T1]{fontenc}
\RequirePackage{caption}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage[pageanchor]{hyperref}
\RequirePackage{setspace}
\RequirePackage{xkeyval}
\RequirePackage{xcolor}
%<<<=====================================================<<<

%>>>=============== Page Layout =========================>>>
\geometry{%
    top=3cm,
    bottom=2cm,
    right=2cm,
    left=3cm,
}
%<<<=====================================================<<<

%>>>================ hypersetup =========================>>>
\hypersetup{%
    colorlinks=true,
    linkcolor=blue!75!green,
    filecolor=magenta,
    citecolor=green!60!blue,
    urlcolor=cyan,
}
%<<<=====================================================<<<

%>>>========= At Begin Document Deffinitions ============>>>
\AtBeginDocument{%
    \captionsetup{font=small}
    \pagestyle{frontheadings}
    \parindent2cm
    \onehalfspacing
}
%<<<=====================================================<<<

%>>>================== Bibliography =====================>>>
\let\oldbibliography\bibliography
\renewcommand{\bibliography}[1]{%
    \cleardoublepage
    \thispagestyle{plain}
    \oldbibliography{#1}
    \addcontentsline{toc}{chapter}{\bfseries\scshape\bibname}
    \markboth{\bibname}{\bibname}
}
%<<<=====================================================<<<

%>>>============== Clear Doublepage =====================>>>
\renewcommand{\cleardoublepage}{%
    \clearpage
    \if@twoside
        \ifodd 
            \c@page
        \else
            \vspace*{\fill}
            \thispagestyle{empty}
            \newpage
            \if@twocolumn\mbox{}\newpage\fi
        \fi
    \fi
}
%<<<=====================================================<<<

%>>>============== Title and Subtitle ===================>>>
\newcommand{\ifgw@title@eng}{}
\newcommand{\ifgw@title@pt}{}
\renewcommand{\title}[2][]{%
    \renewcommand{\ifgw@title@pt}{{#2}}
    \ifx\relax#1\relax\else\renewcommand{\ifgw@title@eng}{{#1}}\fi
}

\newcommand{\thetitle}[1][]{%
    \ifx#1e\relax\ifgw@title@eng\else\ifgw@title@pt\fi
}

\newcommand{\ifgw@subtitle@eng}{}
\newcommand{\ifgw@subtitle@pt}{}
\newcommand{\subtitle}[2][]{%
    \renewcommand{\ifgw@subtitle@pt}{{#2}}
    \ifx\relax#1\relax\else\renewcommand{\ifgw@subtitle@eng}{{#1}}\fi
}

\newcommand{\thesubtitle}[1][]{%
    \ifx#1e\relax\ifgw@subtitle@eng\else\ifgw@subtitle@eng\fi
}

\newcommand{\ifgw@page@title@eng}{%
    \if\relax\ifgw@title@eng\relax
    \else
        \if\relax\ifgw@subtitle@eng\relax
            \MakeUppercase{\textbf{\ifgw@title@eng}}
        \else
            \MakeUppercase{\textbf{\ifgw@title@eng:}}\\\MakeUppercase{\ifgw@subtitle@eng}
        \fi
        \vfill
    \fi
}

\newcommand{\ifgw@page@title@pt}{%
    \if\relax\ifgw@title@pt\relax
    \else
        \if\relax\ifgw@subtitle@pt\relax
            \MakeUppercase{\textbf{\ifgw@title@pt}}
        \else
            \MakeUppercase{\textbf{\ifgw@title@pt:}}\\\MakeUppercase{\ifgw@subtitle@pt}
        \fi
        \vfill
    \fi
}
%<<<=====================================================<<<

%>>>===================== Author ========================>>>
\newcommand{\theauthor}{}
\let\oldauthor\author
\renewcommand{\author}[1]{%
    \oldauthor{{#1}}%
    \renewcommand{\theauthor}{{#1}}
}

\newcommand{\ifgw@page@author}{%
    \if\theauthor\@empty\relax\else\MakeUppercase{\theauthor}\vfill\fi
}
%<<<=====================================================<<<

%>>>===========  Supervisor and Co-supervisor ===========>>>
\newcommand{\thesupervisor}{}
\newcommand{\supervisorname}{Supervisor}
\newcommand{\supervisor}[2][Supervisor]{%
    \renewcommand{\thesupervisor}{{#2}}
    \ifx\relax#1\relax\else\renewcommand{\supervisorname}{{#1}}\fi
}

\newcommand{\thecosupervisor}{}
\newcommand{\cosupervisorname}{}
\newcommand{\cosupervisor}[2][Co-supervisor]{%
    \renewcommand{\thecosupervisor}{{#2}}
    \ifx\relax#1\relax\else\renewcommand{\cosupervisorname}{{#1}}\fi
}

\newcommand{\ifgw@page@supervisor}{%
    \if\thesupervisor\@empty\relax
    \else
        {\supervisorname:}~{\MakeUppercase{\thesupervisor\relax}}\\
    \fi
    \if\thecosupervisor\@empty\relax
    \else
        {\cosupervisorname:}~{\MakeUppercase{\thecosupervisor\relax}}\\
    \fi
}
%<<<=====================================================<<<

%>>>================== Institution ======================>>>
\newcommand{\ifgw@institute@eng}{}
\newcommand{\ifgw@institute@pt}{}
\newcommand{\institute}[2][]{%
    \renewcommand\ifgw@institute@pt{{#2}}
    \ifx\relax#1\relax\else\renewcommand\ifgw@institute@eng{{#1}}\fi
}

\newcommand{\theinstitute}[1][]{%
    \ifx#1e\relax\ifgw@institute@eng\else\ifgw@institute@pt\fi
}

\newcommand{\ifgw@university@eng}{}
\newcommand{\ifgw@university@pt}{}
\newcommand{\university}[2][]{%
    \renewcommand\ifgw@university@pt{{#2}}
    \ifx\relax#1\relax\else\renewcommand\ifgw@university@eng{{#1}}\fi
}

\newcommand{\theuniversity}[1][]{%
    \ifx#1e\relax\ifgw@university@eng\else\ifgw@university@pt\fi
}

\newcommand{\ifgw@page@institution}{%
    \if\ifgw@university@pt\@empty\relax
    \else
        \if\ifgw@institute@pt\@empty\relax
            {\MakeUppercase{\ifgw@university@pt}}
        \else
            {\MakeUppercase{\ifgw@university@pt}}\\~{\ifgw@institute@pt}
        \fi
        \vfill
    \fi 
}
%<<<=====================================================<<<

%>>>================== City and Year ====================>>>
\newcommand{\thecity}{}
\newcommand{\city}[1]{%
    \renewcommand{\thecity}{{#1}}
}

\newcommand{\theyear}{\the\year}

\newcommand{\ifgw@page@city}{%
    \if\thecity\@empty\relax\else\MakeUppercase{\thecity\\\the\year}\fi
}
%<<<=====================================================<<<

%>>>====================== Logo =========================>>>
\newcommand{\ifgw@logo@align@center}{center}
\newcommand{\ifgw@logo@align@left}{flushleft}
\newcommand{\ifgw@logo@align@right}{flushright}
\newlength{\ifgw@logo@width}

\define@key{logo}{width}{\setlength\ifgw@logo@width{#1}}
\define@key{logo}{align}{\def\logo@align{\csname ifgw@logo@align@#1\endcsname}}
\setkeys{logo}{align=left, width=2cm}

\newcommand{\thelogo}{}
\newcommand{\logo}[2][]{%
    \setkeys{logo}{#1}
    \renewcommand{\thelogo}{\includegraphics[width=\ifgw@logo@width]{#2}}
}

\newcommand{\ifgw@page@logo}{%
    \if\thelogo\@empty\relax\else\thelogo\fi
}
%<<<=====================================================<<<

%>>>================== Backcover ========================>>>
\define@key{backcover}{portuguese declaration}{\def\ifgw@backcover@portuguese@declaration{#1}}
\define@key{backcover}{english declaration}{\def\ifgw@backcover@english@declaration{#1}}
\define@key{backcover}{version}{\def\ifgw@backcover@version{#1}}
\define@key{backcover}{language}{\def\ifgw@backcover@language{#1}}
\setkeys{backcover}{%
    portuguese declaration=\@empty,
    english declaration=\@empty,
    version=\@empty,
    language=\@empty
}

\newcommand{\backcover}[1]{%
    \setkeys{backcover}{#1}
}

\def\ifgw@language@pt{portuguese}
\def\ifgw@language@eng{english}

%>>>--------------- Backcover Text ---------------------->>>
\newcommand{\ifgw@page@text}{%
    \hspace*{7.5cm}
    \begin{minipage}{8.5cm}
        \singlespacing
        \if\ifgw@backcover@portuguese@declaration\@empty\relax
        \else
            \ifgw@backcover@portuguese@declaration
            \vskip\baselineskip
        \fi
        \ifx\ifgw@language@pt\ifgw@backcover@language
            \relax
        \else
            \if\ifgw@backcover@english@declaration\@empty
                \relax
            \else
                \ifgw@backcover@english@declaration
            \fi
        \fi
    \end{minipage}
    \vfill
}
%<<<-----------------------------------------------------<<<

%>>>------------- Backcover Version Text ---------------->>>
\newcommand{\ifgw@page@version}{%
    \begin{minipage}{8.5cm}
        \singlespacing
        \if\ifgw@backcover@version\@empty\relax
        \else
        \MakeUppercase{\ifgw@backcover@version}
        \fi
    \end{minipage}
    \vfill
}
%<<<-----------------------------------------------------<<<

%<<<=====================================================<<<

%>>>=================== Maketitle =======================>>>
\renewcommand{\maketitle}{%
    \cleardoublepage
    \thispagestyle{empty}
    \begin{\logo@align}
        \ifgw@page@logo
    \end{\logo@align}
    \begin{center}
        \ifgw@page@institution
        \ifgw@page@author
        \ifgw@page@title@pt
        \ifgw@page@title@eng
        \vfill
        \ifgw@page@city
    \end{center}
    \newpage
}
%<<<=====================================================<<<

%>>>================= Makebackcover =====================>>>
\newcommand{\makebackcover}{%
    \cleardoublepage
    \thispagestyle{empty}
    \begin{center}
        \ifgw@page@author
        \ifx\ifgw@language@pt\ifgw@backcover@language\relax
        \else
            \ifgw@page@title@eng
        \fi
        \ifgw@page@title@pt
        \ifgw@page@text
    \end{center}
    \ifgw@page@supervisor
    \ifgw@page@version
    \begin{center}
        \ifgw@page@city
    \end{center}
    \newpage
}
%<<<=====================================================<<<

%>>>===================== Headings ======================>>>
\def\ps@headings{%
    \def\@evenhead{%
        \parbox{\textwidth}{%
            \thepage
            \hfill
            \rightmark 
            \vskip-0.7\baselineskip
            \rule{\textwidth}{0.7pt}
            \relax
        }
    }

    \def\@oddhead{%
        \parbox{\textwidth}{%
            \leftmark
            \hfill
            \thepage 
            \vskip-0.7\baselineskip
            \rule{\textwidth}{0.7pt}
            \relax
        }
    }

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
%<<<=====================================================<<<

%>>>=========== Frontmatter and Mainmatter ==============>>>
\let\oldfrontmatter\frontmatter
\renewcommand{\frontmatter}{%
    \setcounter{page}{1}
    \oldfrontmatter\pagestyle{plain}
}
\let\oldmainmatter\mainmatter
\renewcommand{\mainmatter}{%
    \oldmainmatter\pagestyle{headings}
}
\let\oldbackmatter\backmatter
\renewcommand{\backmatter}{%
    \oldbackmatter\pagestyle{headings}
}
%<<<=====================================================<<<

%>>>=================== Chapter =========================>>>
\renewcommand{\chaptermark}[1]{\markboth{\thechapter.~#1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection.~#1}{}}

\renewcommand{\chapter}{%
    \@ifstar\ifgw@chapter@star\ifgw@chapter
}

\newlength{\chapterrulewidth}
\setlength{\chapterrulewidth}{1.5\p@}

\newcommand{\ifgw@chapter}[2][]{%
    \cleardoublepage
    \pagestyle{headings}
    \thispagestyle{plain}
    \refstepcounter{chapter}
    \def\chtext{#1}
    \ifx\chtext\@empty\relax\renewcommand{\chtext}{#2}\fi
    \addcontentsline{toc}{chapter}{\scshape\bfseries\thechapter.~#2}
    \@mkboth{\thechapter.~\chtext}{}
    \begingroup
        \selectfont\huge\scshape\noindent\@chapapp~\thechapter
        \vskip\baselineskip
        \linespread{1.5}\noindent{\bfseries#2}
        \vskip5\p@
        \noindent\rule{\textwidth}{\chapterrulewidth}
    \endgroup
    \vskip 35\p@
    \par
}

\newcounter{chapterstar}
\newcommand{\ifgw@chapter@star}[1]{%
    \cleardoublepage
    \@mkboth{}{}
    \begingroup
        \selectfont\huge\bfseries\scshape
        \linespread{1.5}\noindent#1
    \endgroup
    \refstepcounter{chapterstar}
    \vskip 30\p@
    \par
}
%<<<=====================================================<<<

%>>>================== Abstract =========================>>>
\define@key{abstract}{header}{\def\ifgw@abstract@header{#1}}
\define@key{abstract}{name}{\def\ifgw@abstract@name{#1}}
\setkeys{abstract}{name=Abstract, header=\@empty}

\newenvironment{abstract}[1][]{%
    \setkeys{abstract}{#1}
    \chapter*{\ifgw@abstract@name}
    \@mkboth{\ifgw@abstract@name}{}
    \ifx\ifgw@abstract@header\@empty
        \relax
    \else
        {\singlespacing\noindent\ifgw@abstract@header}
    \fi
    \noindent\break
}
    \onehalfspacing
{\newpage}
%<<<=====================================================<<<

%>>>==================== Epigraph =======================>>>
\newcommand{\epigraph}[2]{%
    \cleardoublepage
    \vspace*{\fill}
    \begin{flushright}
        \begin{minipage}{8.5cm}
            {\it #2}\\
            {\hspace*{\fill}\it#1}
        \end{minipage}
    \end{flushright}
    \break\newpage
}
%<<<=====================================================<<<

%>>>================= Dedication ========================>>>
\newcommand{\dedication}[1]{%
    \cleardoublepage
    \vspace*{\fill}
    \begin{flushright}
        \begin{minipage}{7cm}
            {\it#1}
        \end{minipage}
    \end{flushright}
    \pagebreak
}
%<<<=====================================================<<<

\endinput
