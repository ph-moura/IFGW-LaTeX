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
\RequirePackage[pageanchor, hyperfootnotes=false]{hyperref}
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
    \captionsetup{font={footnotesize, singlespacing}}
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
    \refstepcounter{chapterstar}
    \addcontentsline{toc}{chapter}{\bfseries\scshape\bibname}
    \oldbibliography{#1}
    \markboth{\bibname}{\bibname}
    \par
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
\define@key{title}{portuguese}{\def\ifgw@title@portuguese{#1}}
\define@key{title}{english}{\def\ifgw@title@english{#1}}
\setkeys{title}{%
    portuguese={},
    english={},
}

\renewcommand{\title}[1]{%
    \setkeys{title}{#1}
}

\newcommand{\thetitle}[1][]{%
    \ifx#1e\relax\ifgw@title@englishlish\else\ifgw@title@portuguese\fi
}

\define@key{subtitle}{portuguese}{\def\ifgw@subtitle@portuguese{#1}}
\define@key{subtitle}{english}{\def\ifgw@subtitle@english{#1}}
\setkeys{subtitle}{%
    portuguese={},
    english={},
}

\newcommand{\subtitle}[1]{%
    \setkeys{subtitle}{#1}
}

\newcommand{\thesubtitle}[1][]{%
    \ifx#1e\relax\ifgw@subtitle@english\else\ifgw@subtitle@english\fi
}

\newcommand{\ifgw@page@title@eng}{%
    \ifx\ifgw@title@english\@empty\relax
    \else
        \ifx\ifgw@subtitle@english\@empty\relax
            \MakeUppercase{\textbf{\ifgw@title@english}}
        \else
            \MakeUppercase{\textbf{\ifgw@title@english:}}\\\MakeUppercase{\ifgw@subtitle@english}
        \fi
        \vfill
    \fi
}

\newcommand{\ifgw@page@title@pt}{%
    \ifx\ifgw@title@portuguese\@empty\relax
    \else
        \ifx\ifgw@subtitle@portuguese\@empty\relax
            \MakeUppercase{\textbf{\ifgw@title@portuguese}}
        \else
            \MakeUppercase{\textbf{\ifgw@title@portuguese:}}\\\MakeUppercase{\ifgw@subtitle@portuguese}
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
\define@key{institute}{portuguese}{\def\ifgw@institute@portuguese{#1}}
\define@key{institute}{english}{\def\ifgw@institute@english{#1}}
\setkeys{institute}{%
    portuguese={},
    english={},
}

\newcommand{\institute}[1]{%
    \setkeys{institute}{#1}
}

\newcommand{\theinstitute}[1][]{%
    \ifx#1e\relax\ifgw@institute@english\else\ifgw@institute@portuguese\fi
}

\define@key{university}{portuguese}{\def\ifgw@university@portuguese{#1}}
\define@key{university}{english}{\def\ifgw@university@english{#1}}
\define@key{university}{spanish}{\def\ifgw@university@spanish{#1}}
\setkeys{university}{%
    portuguese={},
    english={},
}

\newcommand{\university}[1]{%
    \setkeys{university}{#1}
}

\newcommand{\theuniversity}[1][]{%
    \ifx#1e\relax\ifgw@university@english\else\ifgw@university@portuguese\fi
}

\newcommand{\ifgw@page@institution}{%
    \if\ifgw@university@portuguese\@empty\relax
    \else
        \if\ifgw@institute@portuguese\@empty\relax
            {\MakeUppercase{\ifgw@university@portuguese}}
        \else
            {\MakeUppercase{\ifgw@university@portuguese}}\\~{\ifgw@institute@portuguese}
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
    portuguese declaration={},
    english declaration={},
    version={},
    language={}
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
            \footnotesize
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
            \footnotesize
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
    \def\@oddhead{{\footnotesize\hfill\thepage}}
    \def\@evenhead{{\footnotesize\thepage\hfill}}
}

\def\ps@myheadings{\ps@headings}

\def\ps@frontheadings{%
    \let\@oddhead\@empty\let\@evenhead\@empty
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

%>>>=================== Appendix ========================>>>
\newif\ifinappendix
\let\oldappendix\appendix
\renewcommand{\appendix}{%
  \oldappendix%
  \inappendixtrue%
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
    \@mkboth{\thechapter.~\chtext}{}
    \begingroup
        \noindent
        \selectfont\huge\scshape\bfseries
        \ifinappendix
            \addcontentsline{toc}{chapter}{\scshape\bfseries\appendixname~\thechapter.~#2}%
            \parbox[t]{\textwidth}{
                \appendixname~\thechapter~-~#2
                \newline
                \rule{\textwidth}{\chapterrulewidth}%
            }
        \else
            \addcontentsline{toc}{chapter}{\scshape\bfseries\thechapter.~#2}%
            \thechapter~~%
            \parbox[t]{15cm}{
                #2%
                \newline%
                \hspace*{-0.75cm}%
                \rule{\textwidth}{\chapterrulewidth}%
            }%
        \fi
    \endgroup
    \vskip 25\p@
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
\setkeys{abstract}{name=Abstract, header={}}

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

%>>>================= Long Citation =====================>>>
\newenvironment{longcitation}[1][]{%
    \noindent
    \hspace{4cm}
    \begin{minipage}{12cm}
    \singlespacing\footnotesize
}
{%
    \end{minipage}
    \vskip\baselineskip%
}
%<<<=====================================================<<<

%>>>==================== Epigraph =======================>>>
\newcommand{\epigraph}[2]{%
    \cleardoublepage
    \vspace*{\fill}
    \begin{flushright}
        \begin{minipage}{8.5cm}
            {\it #2}\\
            {%
                \if\relax#1\relax
                \else
                    \hspace*{\fill}\it(#1)
                \fi
            }%
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
