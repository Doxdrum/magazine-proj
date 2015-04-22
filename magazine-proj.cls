%% magazine-proj.cl
%% A LaTeX class for writing magazines
%% Project started on 2015/04/17
%% by Oscar Castillo-Felisola
%% aka Doxdrum
%% %%%%%%%%%% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{magazine-proj}[2015/04/17 v0.1 LaTeX package for magazines]
\DeclareOption{letterpaper}{\PassOptionsToClass{letterpaper}{article}}
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{article}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{article}}
\DeclareOption*{%
  \ClassWarning{magazine-proj}{Unknown option `\CurrentOption' ignored}%
}
\ExecuteOptions{10pt,twoside}
\ProcessOptions\relax
\LoadClass[letterpaper]{article}
\RequirePackage{xparse}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}   
\RequirePackage[scaled]{helvet}
\RequirePackage{xcolor}
\RequirePackage[compact]{titlesec}
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
\RequirePackage[textwidth=182mm,textheight=252mm,hmarginratio=1:1,vmarginratio=1:1]{geometry}
\RequirePackage{multicol}
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage[absolute]{textpos}
\RequirePackage{rotating}
\RequirePackage{graphicx}
\RequirePackage{wrapfig}
\RequirePackage{colortbl}
\RequirePackage{array}
\RequirePackage[subsectionbib]{bibunits}
\AtBeginDocument{
  \RequirePackage[linktocpage,colorlinks=true,urlcolor=blue,linkcolor=blue,citecolor=red]{hyperref}
  \hypersetup{pdftitle={\magazinename, \magazinedate}}
  \@ifpackagewith{babel}{spanish}{%
    \addto\captionsspanish{%
      \renewcommand*\authoredby{Por}
    }
  }{}
}
\setlength{\columnsep}{0.5cm}
\setcounter{DefaultLines}{3}
\DeclareRobustCommand\authoredby{By}
\DeclareRobustCommand\magazinename{Magazine~Project}
\DeclareRobustCommand\magazinedate{04/2015}
\NewDocumentCommand\autarticle{ m }{%
  \begin{flushleft}
    \textbf{\authoredby:}~#1
  \end{flushleft}
}
\NewDocumentCommand\lead{ m }{
  \begin{spacing}{2}
    \begin{flushleft}
      {\huge #1}
    \end{flushleft}
  \end{spacing}
  \vfill{}
  \columnbreak{}
}
\NewDocumentEnvironment{article}{ O{3} m m m m }{%
  \pdfbookmark{#3}{#2}
  \begin{bibunit}[utphys]
    \begin{multicols}{#1}[\section*{#3}]
      \begin{spacing}{1.05}
        \autarticle{#4}
        \vskip-3em{}%
        \lead{#5}
}{%
      \end{spacing}
    \end{multicols}
  \end{bibunit}
  \clearpage
}
\definecolor{dunkelgrau}{gray}{0.25}
\definecolor{mittelgrau}{gray}{0.85}
\definecolor{hellgrau}{gray}{0.93}
\definecolor{mittelblau}{rgb}{0.27,0.5,1.0}
\definecolor{hellgelb}{rgb}{1.0,1.0,0.9}
\definecolor{url}{rgb}{0,0,0}
\titleformat{\section}{\normalfont\Huge}{}{0mm}{}
\titleformat{\subsection}{\normalfont\large\bfseries\scshape}{}{0mm}{}
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
\NewDocumentCommand\colbox{ m m m }{\colorbox{#1}{\textcolor{#2}{#3}}}
\NewDocumentCommand\maincolor{ O{mittelblau} }{ #1 }
\NewDocumentCommand\maintextcolor{ O{white} }{ #1 }
\NewDocumentCommand\SetMainColor{ m }{\renewcommand*{\maincolor}{#1}}
\NewDocumentCommand\SetMainTextColor{ m }{\renewcommand*{\maintextcolor}{#1}}
\let\oldsubsection=\subsection
\setlength{\fboxsep}{0.2em}
\DeclareDocumentCommand\subsection{ s m }{
  \oldsubsection*{\colbox{\maincolor}{\maintextcolor}{\parbox{\linewidth-2\fboxsep-2\fboxrule}{#2}}}\noindent{}%
}
\NewDocumentCommand\Initial{ m }{
  \lettrine[nindent=-0.1mm,findent=0.7ex,lraise=0.3,loversize=-.05]{%
    \colbox{\maincolor}{\maintextcolor}{%
      \begin{minipage}{0.9em}%
        \centering{#1} %
      \end{minipage}%
    }%
  }{}%
}
\setlist[itemize]{itemsep=0.0em,leftmargin=*,label=\textcolor{\maincolor}{\footnotesize$\blacksquare$}}
\setlist[enumerate]{itemsep=0.0em,leftmargin=*}
%% TO BE DEPRECATED AFTER CONFIGURING
%% BIBUNITS CORRECTLY
\newlist{bibenum}{enumerate}{3}
\setlist[bibenum]{label=[\arabic*]}
