> Status do Projeto: Em desenvolvimento :warning:
# IFGW-Unicamp 


> LaTeX class for the Ph.D. thesis


## Table of Contents
1. [ Description. ](#desc)
2. [ Instalation. ](#inst)
3. [ Usage. ](#use)
	- [ Usefull commands. ](#usfcmd)
	- [ Some Suggested Packages. ](#sspkg)
	- [ Handling Figures and Tables.](#hdlf)


<a name="desc"></a>
## 1. Description
This is a LaTeX class for the Ph.D. thesis of _"Gleb Wataghin" Institute of Physics_ at the _University of Campinas_.


<a name="inst"></a>
## 2. Installation

To use locally just put the file _ifgw.cls_ in the same directory as the document.

<a name="use"></a>
## 3. Usage

To load the class, use the following comand:
```Latex
\documentclass[oneside]{ifgw}
```
By default, the _a4paper_ and _12pt_ are passed. The _[oneside]_ is optional.
Some macros are defined 

```Latex
\documentclass[oneside]{phd-thesis}

\title[Título da tese]{ Title of the thesis}	 
\author{Paulo H. de Moura}	 
\supervisor{Name of the Supervisor}	
\cosupervisor{Name of the Co-supervisor}  % Optional 
\institute[Nome do Instituto]{Institute Name}	 
\university[Nome da Universidade]{University Name}	 
\location{City}	
\logo{path/to/logo} % Default: align=left, width=2cm  

\backcover{
	first language={
		Thesis presented to the \theinstitute~of the \theuniversity~in partial 
		fulfillment of the requirements for the degree of \uppercase{Master Jedi}, 
		in the area of \uppercase{Jedi Guardian}.
	},
	second language={
		Tese apresentada ao \theinstitute[2]~da \theuniversity[2]~como parte 
		dos requisitos exigidos para a obtenção do título de \uppercase{Mestre Jedi}, 
		na Área de \uppercase{Jedi Guardião}.
	}, 
	version text={
		Este trabalho corresponde à versão final da tese defendida pelo 
		aluno \theauthor~e orientada pelo Prof. Dr. \thesupervisor.
	}
}

\begin{document}

\maketitle
\makebackcover

\dedication{To my son, Luke Skywalker.}
\epigraph{Master Yoda}{May the Force be with you!}

% Resumo
\begin{abstract}[name=Resumo]
 Escreva seu resumo aqui.
\end{abstract}

% Abstract
\begin{abstract}
 Write your abstract here.
\end{abstract}

% Sumário
\tableofcontents

\end{document}
```

These macros set the _title_, the _author_, the _supervisor_, the _co-supervisor_ (optional), the name of the _Institute_, the name of the _University_, the _city_, the _logo_ (optional) and the text for the cover page, respectively. 

<a name="usfcmd"></a>
### 3.1 Useful commands


<a name="sspkg"></a>
### 3.2 Some Suggested Packages


<a name="hdlf"></a>
### 3.3 Handling Figures and Tables


##
