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
\documentclass[oneside]{ifgw}

\title{}
\author{}
\supervisor{}
\cosupervisor{}
\institute{}
\university{}
\location{}
\logo[align=left]{Path/to/logo}
\facepagetext{}
```

These macros set the _title_, the _author_, the _supervisor_, the _co-supervisor_ (optional), the name of the _Institute_, the name of the _University_, the _city_, the _logo_ (optional) and the text for the cover page, respectively. 

<a name="usfcmd"></a>
### 3.1 Useful commands


<a name="sspkg"></a>
### 3.2 Some Suggested Packages


<a name="hdlf"></a>
### 3.3 Handling Figures and Tables


##
