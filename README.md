> Status do Projeto: Em desenvolvimento :warning:
# IFGW-LaTeX


> LaTeX class for the Ph.D. thesis

## Table of Contents
1. [ Description. ](#desc)
2. [ Instalation. ](#inst)
3. [ Usage. ](#use)

<a name="desc"></a>
## 1. Description
This is a LaTeX class for the Ph.D. thesis of _Gleb Wataghin Institute of Physics_ at the _University of Campinas_.


<a name="inst"></a>
## 2. Installation

To use locally just put the file _ifgw.cls_ in the same directory as the document.

<a name="use"></a>
## 3. Usage

To load the class, use the following comand:
```Latex
\documentclass[oneside]{ifgw}
```
By default, the _a4paper_ and _12pt_ are passed. The _[oneside]_ is optional. Some macros are defined

```Latex
\author{}
\title[]{}
\subtitle[]{}
\supervisor[]{}
\cosupervisor[]{}
\institute[]{}
\university[]{}
\city{}
\logo[]{}
\backcover{
    first declaration={},
    second declaration={},
    version={}
}
```

These macros set the _author_, _title_, _subtitle_, _supervisor_, _co-supervisor_ (optional), the name of the _Institute_, the name of the _University_, the _city_, the _logo_ and the text for the cover page, respectively.

The _abstract_, _resumo_ and the _acknowledgement_ sections can be done as follows:

```Latex
\begin{abstract}

\end{abstract}

\begin[name=Resumo]{abstract}

\end{abstract}

\begin[name=Agradecimentos]{abstract}

\end{abstract}
```

Putting all together:

```Latex
\documentclass[oneside, 12pt]{ifgw}
\usepackage{amsmath}
\usepackage{cite}
\usepackage{fourier}
\usepackage{lipsum}
\usepackage{pdfpages}

\author{Anakin Skywalker}
\city{Tatooine}
\cosupervisor[Co-orientador]{Obi-Wan Kenobi}
\institute[Darth Plagueis Institute]{Instituto Darth Plagueis}
\logo[align=left]{Images/unicamp.png}
\supervisor[Orientador]{Master Yoda}
\title[Star Wars]{Guerra nas estrelas}
\subtitle[May the Force be with you]{Que a Força esteja com você}
\university[University of the Galactic Empire]{Universidade do Império Galático}

\backcover{
    first declaration={
        Thesis presented to the \theinstitute[e]~of the \theuniversity[e]~in
        partial fulfillment of the requirements for the de\-gree of
        \uppercase{Doctor of Science}, in the area of \uppercase{Physics}.
    },
    second declaration={
        Tese apresentada ao \theinstitute~da \theuniversity~como
        parte dos requisitos exigidos para a obtenção do título de
        \uppercase{Doutor em Ciências}, na Área de \uppercase{Física}.
    },
    version={
        Es\-te tra\-ba\-lho cor\-res\-pon\-de à ver\-são fi\-nal da
        te\-se de\-fen\-di\-da pe\-lo a\-lu\-no \theauthor~e
        ori\-en\-ta\-da pe\-lo Prof. Dr. \thesupervisor.
    }
}

\begin{document}

\maketitle
\makebackcover

\includepdf[pages=-]{PDFs/ficha_catalografica}
\includepdf[pages=-]{PDFs/folha_de_aprovacao}

\dedication{To my son, Luke Skywalker.}
\epigraph{Master Yoda}{May the Force be with you!}

\include{Chapters/agradecimentos}
\include{Chapters/resumo}
\include{Chapters/abstract}

\listoffigures
\listoftables
\tableofcontents

\include{Chapters/ch01}
\include{Chapters/ch02}
\include{Chapters/ch03}
\include{Chapters/ch04}
\include{Chapters/ch05}
\include{Chapters/ch06}

\bibliographystyle{naturemag}
\bibliography{Chapters/StarWars}

\appendix
\include{Chapters/ch07}
\include{Chapters/ch08}
\include{Chapters/ch09}

\end{document}
```
