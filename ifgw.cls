\NeedsTeXFormat{LaTeX2e}[1994/06/01]

\ProvidesClass{ifgw}[2021/02/05 v0.0.1 IFGW class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[a4paper, 12pt]{book}

%>>>=============== Required Packages ===================>>>
\RequirePackage[T1]{fontenc}
\RequirePackage{geometry}
% \RequirePackage[dvipdfm]{graphicx}
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
    includehead,
    % includefoot,
}
%<<<=====================================================<<<

%>>>================ hypersetup =========================>>>
\hypersetup{
    colorlinks=true,
    linkcolor=blue!75!green,
    filecolor=magenta,
    citecolor=green!60!blue,
    urlcolor=cyan,
}
%<<<=====================================================<<<

%>>>========= At Begin Document Deffinitions ============>>>
\AtBeginDocument{
    \def\captionfont{\small}
    \pagestyle{frontheadings}
    \parindent2cm
    \onehalfspacing
    \makeatletter
    \newwrite\@los
    \IfFileExists{\jobname.los}{}{\immediate\openout\@los=\jobname.los}
    \makeatother
}
%<<<=====================================================<<<

%>>>================== Bibliography =====================>>>
\let\oldbibliography\bibliography
\renewcommand{\bibliography}[1]{
    \cleardoublepage
    \thispagestyle{plain}
    \oldbibliography{#1}
    \addcontentsline{toc}{chapter}{\bfseries\scshape\bibname}
    \markboth{\bibname}{\bibname}
}
%<<<=====================================================<<<

%>>>============== Clear Doublepage =====================>>>
\renewcommand{\cleardoublepage}{\clearpage
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
%<<<=====================================================<<<

%>>>============== Title and Subtitle ===================>>>
\newcommand{\titlei}{}
\newcommand{\titleii}{}
\renewcommand{\title}[2][]{
    \renewcommand{\titlei}{{#2}}
    \ifx\relax#1\relax
    \else
        \renewcommand{\titleii}{{#1}}
    \fi
}

\newcommand{\thetitle}[1][]{
    \ifx#12\relax\titleii\else\titlei\fi    
}

\newcommand{\subtitlei}{}
\newcommand{\subtitleii}{}
\newcommand{\subtitle}[2][]{
    \renewcommand\subtitlei{{#2}}
    \ifx\relax#1\relax
    \else
        \renewcommand\subtitleii{{#1}}
    \fi
}

\newcommand{\thesubtitle}[1][]{
    \ifx#12\relax\subtitleii\else\subtitlei\fi  
}

\def\page@title{
    \if\relax\titlei\relax
    \else
        \if\relax\subtitlei\relax
            \MakeUppercase{\bfseries\titlei}
        \else
            \MakeUppercase{\bfseries\titlei:}\\\MakeUppercase{\subtitlei}
        \fi
        \vfill
    \fi
    \if\relax\titleii\relax
    \else
        \if\relax\subtitleii\relax
            \MakeUppercase{\bfseries\titleii}
        \else
            \MakeUppercase{\bfseries\titleii:\\}\MakeUppercase{\subtitleii}
        \fi
        \vfill
    \fi
    \vfill
}
%<<<=====================================================<<<

%>>>===================== Author ========================>>>
\newcommand{\theauthor}{}
\let\oldauthor\author
\renewcommand{\author}[1]{%
    \oldauthor{{#1}}%
    \renewcommand{\theauthor}{{#1}}
}

\def\page@author{
    \if\theauthor\@empty\relax
    \else
        \MakeUppercase{\theauthor}
        \vfill
    \fi
}
%<<<=====================================================<<<

%>>>===========  Supervisor and Co-supervisor ===========>>>
\newcommand{\thesupervisor}{}
\newcommand{\supervisorname}{Supervisor}
\newcommand{\supervisor}[2][Supervisor]{%
    \renewcommand{\supervisorname}{{#1}}
    \renewcommand{\thesupervisor}{{#2}}
}

\newcommand{\thecosupervisor}{}
\newcommand{\cosupervisorname}{}
\newcommand{\cosupervisor}[2][Co-supervisor]{%
    \renewcommand{\cosupervisorname}{{#1}}
    \renewcommand{\thecosupervisor}{{#2}}
}

\def\page@supervisor{
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
\newcommand{\institutei}{}
\newcommand{\instituteii}{}
\newcommand{\institute}[2][]{
    \renewcommand\institutei{{#2}}
    \renewcommand\instituteii{{#1}}
}

\newcommand{\theinstitute}[1][]{
    \ifx#12\relax\instituteii\else\institutei\fi    
}

\newcommand{\universityi}{}
\newcommand{\universityii}{}
\newcommand{\university}[2][]{
    \renewcommand\universityi{{#2}}
    \renewcommand\universityii{{#1}}
}

\newcommand{\theuniversity}[1][]{
    \ifx#12\relax\universityii\else\universityi\fi  
}

\def\page@institution{
    \if\universityi\@empty\relax
    \else
        \if\institutei\@empty\relax
            {\MakeUppercase{\universityi}}
        \else
            {\MakeUppercase{\universityi}}\\~{\institutei}
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

\def\page@city{
    \if\thecity\@empty\relax
    \else
        \MakeUppercase{\thecity\\\the\year}
    \fi
}
%<<<=====================================================<<<

%>>>====================== Logo =========================>>>
\def\logo@align@center{center}
\def\logo@align@left{flushleft}
\def\logo@align@right{flushright}
\newlength{\logo@width}

\define@key{logo}{width}{\setlength\logo@width{#1}}
\define@key{logo}{align}{\def\logo@align{\csname logo@align@#1\endcsname}}
\setkeys{logo}{align=left, width=2cm}

\newcommand{\thelogo}{}
\newcommand{\logo}[2][]{
    \setkeys{logo}{#1}
    \renewcommand{\thelogo}{\includegraphics[width=\logo@width]{#2}}
}

\def\page@logo{
    \if\thelogo\@empty\relax
    \else
        \thelogo
    \fi
}
%<<<=====================================================<<<

%>>>================== Backcover ========================>>>
\define@key{backcover}{first text}{\def\backcover@first@text{#1}}
\define@key{backcover}{second text}{\def\backcover@second@text{#1}}
\define@key{backcover}{version text}{\def\backcover@version@text{#1}}

\setkeys{backcover}{    
    first text=\@empty, 
    second text=\@empty, 
    version text=\@empty
}

\newcommand{\backcover}[1]{
    \setkeys{backcover}{#1}
}

%>>>--------------- Backcover Text ---------------------->>>
\def\page@text{
    \hspace*{7.5cm}
    \begin{minipage}{8.5cm}
        \singlespacing
        \if\backcover@first@text\@empty\relax
        \else
            \backcover@first@text
            \vskip\baselineskip
        \fi
        \if\backcover@second@text\@empty
            \relax
        \else
            \backcover@second@text
        \fi
    \end{minipage}
    \vfill
}
%<<<-----------------------------------------------------<<<

%>>>------------- Backcover Version Text ---------------->>>
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
%<<<-----------------------------------------------------<<<

%<<<=====================================================<<<

%>>>=================== Maketitle =======================>>>
\renewcommand{\maketitle}{%
    \cleardoublepage
    \thispagestyle{empty}
    \begin{\logo@align}
        \page@logo
    \end{\logo@align}
    \begin{center}
        \page@institution
        \page@author
        \page@title 
        \vfill
        \page@city  
    \end{center}
    \newpage
}
%<<<=====================================================<<<

%>>>================= Makebackcover =====================>>>
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
\renewcommand\frontmatter{
    \setcounter{page}{1}
    \oldfrontmatter\pagestyle{plain}
}

\let\oldmainmatter\mainmatter
\renewcommand\mainmatter{
    \oldmainmatter\pagestyle{headings}
}
\let\oldbackmatter\backmatter
\renewcommand\backmatter{
    % \renewcommand{\thepage}{\roman{page}}
    \oldbackmatter\pagestyle{headings}
}
%<<<=====================================================<<<

%>>>=================== Chapter =========================>>>
\renewcommand{\chaptermark}[1]{\markboth{\thechapter.~#1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection.~#1}{}}

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
    \addcontentsline{toc}{chapter}{\scshape\bfseries\thechapter.~#2}
    \@mkboth{\thechapter.~\chtext}{}
    \begingroup
        % \vspace*{20\p@}
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
\newcommand\ifgw@chapter@star[1]{
    \cleardoublepage
    \@mkboth{}{}
    % \thispagestyle{frontheadings}
    \begingroup
        % \vspace*{20\p@}
        \selectfont\huge\bfseries\scshape
        \linespread{1.5}\noindent#1
    \endgroup
    \refstepcounter{chapterstar}
    \vskip 30\p@
    \par
}
%<<<=====================================================<<<

%>>>================== Abstract =========================>>>
\define@key{abstract}{header}{\def\abstract@header{#1}}
\define@key{abstract}{name}{\def\abstract@name{#1}}
\setkeys{abstract}{name=Abstract, header=\@empty}

\newenvironment{abstract}[1][]{%
    \setkeys{abstract}{#1}
    \chapter*{\abstract@name}
    % \thispagestyle{frontheadings}
    \addcontentsline{toc}{chapter}{\bfseries\scshape\abstract@name}
    \@mkboth{\abstract@name}{}
    \ifx\abstract@header\@empty
        \relax
    \else
        {\singlespacing\noindent\abstract@header}
    \fi
    \noindent\break
}
    \onehalfspacing
{\newpage}
%<<<=====================================================<<<

%>>>==================== Epigraph =======================>>>
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
%<<<=====================================================<<<

%>>>================= Dedication ========================>>>
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
%<<<=====================================================<<<

%>>>============== Bra, Ket and Braket ==================>>>
\newcommand{\bra}[1]{\left\langle#1\right|}
\newcommand{\ket}[1]{\left|#1\right\rangle}
\newcommand{\braket}[3][]{
    \ifx\relax#1\relax
        \left\langle#2\middle|#3\right\rangle
    \else
        \left\langle#2\middle|#1\middle|#3\right\rangle
    \fi
}
%<<<=====================================================<<<

%>>>================ List of Symbols ====================>>>
\newcommand{\newsymbol}[3]{
    \newcounter{#1}
    \expandafter\newcommand\expandafter{\csname #1\endcsname}{
        \refstepcounter{#1}
        \TextOrMath{$#2$}{#2}
        \if\csname the#1\endcsname1\relax
            \def\file@line{\TextOrMath{$#2$}{#2}}
            \def\symb@description{#3}
            \immediate\write\@los{%
                \string\symbolsline%
                \string{\string#1\string}%
                \string{\unexpanded\expandafter{\file@line}\string}%
                \string{\unexpanded\expandafter{\symb@description}\string}%
                \string{\thepage\string}%
            }
        \fi
    }
}

\newcommand{\symbolsline}[4]{%
    \noindent%
    \begingroup%
    \singlespacing\flushleft#2{~\dotfill~}%
    \begin{minipage}[t]{10cm}%
        \hyperlink{page.#4}{#3\hfill\textcolor{black}{~#4}}%
    \end{minipage}%
    \par
    \endgroup%
}

\newcommand{\listofsymbols}[1][]{%
    \ifx\relax#1\relax\newcommand{\losname}{List of symbols}\else\newcommand{\losname}{#1}\fi
    \cleardoublepage
    \chapter*{\losname}
    \addcontentsline{toc}{chapter}{\bfseries\scshape \losname}
    \vskip\baselineskip
    \IfFileExists{\jobname.los}{\input{\jobname.los}}{}
}
%<<<=====================================================<<<

\endinput
