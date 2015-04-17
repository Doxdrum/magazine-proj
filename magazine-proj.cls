%% magazine-proj.cl
%% A LaTeX class for writing magazines
%% Project started on 2015/04/17
%% by Oscar Castillo-Felisola
%% aka Doxdrum
%% %%%%%%%%%% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{magazine-proj}[2015/04/17 v0.1 LaTeX package for magazines]
\DeclareOption{letterpaper}{\PassOptionsToClass{letterpaper}{scrartcl}}
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{scrartcl}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{scrartcl}}
\DeclareOption*{%
  \ClassWarning{magazine-proj}{Unknown option `\CurrentOption' ignored}%
}
\ExecuteOptions{10pt,twoside}
\ProcessOptions\relax
\LoadClass[letterpaper]{scrartcl}
\RequirePackage{xparse}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}   
\RequirePackage[scaled]{helvet}
\RequirePackage{xcolor}
\RequirePackage{titlesec}
\RequirePackage{calc}
\RequirePackage{lettrine}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
\RequirePackage{amstext}
\RequirePackage{mathrsfs}
\RequirePackage{dsfont}
\RequirePackage{enumitem}
\RequirePackage{listings}
\RequirePackage[textwidth=182mm,textheight=261mm,hmarginratio=1:1,vmarginratio=1:1]{geometry}
\RequirePackage{multicol}
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage[absolute]{textpos}
\RequirePackage{rotating}
\RequirePackage{graphicx}
\RequirePackage{wrapfig}
\RequirePackage{colortbl}
\RequirePackage{array}
\AtBeginDocument{
  \RequirePackage[linktocpage,colorlinks=true,urlcolor=blue,linkcolor=blue,citecolor=red]{hyperref}
}
\setlength{\columnsep}{0.5cm}
\NewDocumentCommand\lead{ m }{%
  \vspace*{\stretch{1}}
  \begin{spacing}{2}
    \begin{flushleft}
      {\huge #1}
    \end{flushleft}
  \end{spacing}
  \vspace*{\stretch{1}}
  \columnbreak{}
}
\NewDocumentEnvironment{article}{ O{3} m m m m }{%
  \pdfbookmark{#3}{#2}
  \begin{multicols}{#1}[\section*{#3}]
    \begin{spacing}{1.05}
      \Autor{#4}
      \vskip-3em{}%
      \lead{#5}
}{%
  \end{spacing}
  \end{multicols}
  \clearpage
}


\lstdefinestyle{StyleListingBasic}{%
  basicstyle=\ttfamily,
  frame=single,
  framesep=1pt,
  framerule=0.8pt,
  rulecolor=\color{dunkelgrau},
  breaklines=true,
  breakindent=0pt
}
\lstdefinestyle{StyleCommand}{%
  style=StyleListingBasic,
  backgroundcolor=\color{mittelgrau},
  prebreak=\mbox{\textbackslash{}}
}
\lstdefinestyle{StyleListing}{%
  style=StyleListingBasic,
  backgroundcolor=\color{hellgelb}
}
