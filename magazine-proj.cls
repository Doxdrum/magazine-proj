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
%% \AtEndPreamble{
\RequirePackage[linktocpage,colorlinks=true,urlcolor=blue,linkcolor=blue,citecolor=red]{hyperref}
%% }
