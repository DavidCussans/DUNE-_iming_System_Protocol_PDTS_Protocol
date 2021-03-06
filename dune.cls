% -*- latex -*-
%
% Document class for Conceptual Design Report

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dune}[2015/02/02]
\LoadClass[12pt,letterpaper]{article}

\RequirePackage[letterpaper,margin=2cm]{geometry}

% Required values and their setters
\newcommand\thedoctitle{DRAFT Technical Design Report}
\newcommand\thedocsubtitle{Deep Underground Neutrino Experiment (DUNE) and Long-Baseline Neutrino Facility (LBNF)}
\def\titleextra{ }

%%% numbers below count section digits (not the chapter digit)
% set depth of sectioning to appear in the table of contents
% "2" will show chapter/section/subsection
% "3" will additionally include subsubsection
% note, this also governs the depth of the PDF "Index"
\setcounter{tocdepth}{2}
% set depth to which numbering is applied.  
% "3" will number chapter/section/subsection/subsubsection
% "4" will additionally number subsubsubsection 
\setcounter{secnumdepth}{4}
% note: numbering in the text and ToC are the same.
% You can have unnumbered (sub*N)sections in the ToC if
%  secnumdepth < tocdepth

%%%%%%%%%%%%
%% https://tex.stackexchange.com/a/60212
% Provide finer-grained sectioning.
\RequirePackage{titlesec}
\titleclass{\subsubsubsection}{straight}[\subsection]

\newcounter{subsubsubsection}[subsubsection]
\renewcommand\thesubsubsubsection{\thesubsubsection.\arabic{subsubsubsection}}
\renewcommand\theparagraph{\thesubsubsubsection.\arabic{paragraph}} % optional; useful if paragraphs are to be numbered

\titleformat{\chapter}[display]
    {\normalfont\huge\bfseries}{\chaptertitlename\ \thechapter}{20pt}{\Huge}[\glsresetall]
\titleformat{\subsubsubsection}
  {\normalfont\normalsize\bfseries}{\thesubsubsubsection}{1em}{}
\titlespacing*{\subsubsubsection}
{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

\makeatletter
\renewcommand\paragraph{\@startsection{paragraph}{5}{\z@}%
  {3.25ex \@plus1ex \@minus.2ex}%
  {-1em}%
  {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{6}{\parindent}%
  {3.25ex \@plus1ex \@minus .2ex}%
  {-1em}%
  {\normalfont\normalsize\bfseries}}
\def\toclevel@subsubsubsection{4}
\def\toclevel@paragraph{5}
\def\toclevel@paragraph{6}
\def\l@subsubsubsection{\@dottedtocline{4}{7em}{4em}}
\def\l@paragraph{\@dottedtocline{5}{10em}{5em}}
\def\l@subparagraph{\@dottedtocline{6}{14em}{6em}}
\makeatother
%%%%%%%%%%%%%%%%%%%%%%%

%%% original: messes up the index
% \newcounter{subsubsubsection}[subsubsection]
% \def\subsubsubsectionmark#1{}
% \def\thesubsubsubsection {\thesubsubsection
%      .\arabic{subsubsubsection}}
% \def\subsubsubsection{\@startsection
%      {subsubsubsection}{4}{\z@} {-3.25ex plus -1
%      ex minus -.2ex}{1.5ex plus .2ex}{\bf\normalsize\sffamily}}
% \def\l@subsubsubsection{\@dottedtocline{4}{4.8em}
%      {4.2em}}


% List of other packages required, add as needed.
% Some basic packages
\RequirePackage{soul}
\RequirePackage{graphicx}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
% used for local line spacing changes such as in the title
\RequirePackage{setspace}
% Anne adds parskip 5/7/15
\RequirePackage{parskip}
\setlength{\parskip}{\baselineskip}

\RequirePackage{capt-of}

% Smart end-of-macro spacing
\RequirePackage{xspace}
% Let's use units properly and consistently!
\RequirePackage[detect-all=true,group-digits=true,group-separator={,},binary-units=true]{siunitx}
% this option trips up some people (eg, tom junk): group-minimum-digits=4,

% Long table is long
\RequirePackage{longtable}

% For abbrev/acronym lists
% \RequirePackage[intoc]{nomencl}
% \makenomenclature  % does this belong here or outside of the class?
% \renewcommand{\nomname}{Acronyms, Abbreviations and Terms}
% \setlength{\nomlabelwidth}{0.2\textwidth}

% Tighter control of floats.
\RequirePackage{placeins}


\RequirePackage[table,usenames,pdftex,dvipsnames]{xcolor}

%% fixme: this needs to be controlled by "draft"
% \RequirePackage[color]{showkeys}

% Remove from here to allow Minted etc. to work

%\RequirePackage[pagewise]{lineno}
\RequirePackage{lineno}



\RequirePackage{framed}
\RequirePackage{wrapfig}
\RequirePackage{tikz}
\RequirePackage[skins]{tcolorbox}

\usetikzlibrary{snakes}
\usetikzlibrary{matrix}
\usetikzlibrary{trees}
\usetikzlibrary{positioning,arrows}
\usetikzlibrary{decorations.pathmorphing}
\usetikzlibrary{decorations.markings}
\usetikzlibrary{shadings}% needed by tcolorbox

% fixme's, must folow xcolor, tikz, ifthen
\RequirePackage{todonotes}
\RequirePackage{menukeys}
\setlength{\marginparwidth}{2cm}

% Fancier headers
\RequirePackage{fancyhdr}

\newcommand{\titlepagecornerblock}{}  
\fancypagestyle{empty}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{titlepage}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \fancyhead[RO]{\titlepagecornerblock}
  \fancyfoot[C]{\includegraphics[width=0.4\textwidth]{dunelogo_colorhoriz}}
}
\fancypagestyle{plain}{
  \fancyhf{}
  \fancyfoot[C]{\bfseries \thepage} % except the center
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{simple}{
  \fancyhf{}
  \fancyhead[RO,LE]{\textsf{\footnotesize \thechapter--\thepage}}
  \fancyhead[LO,RE]{\textsf{\footnotesize \leftmark}}
  \fancyfoot[CO,CE]{\textsf{\footnotesize \explong}}
}
% Avoid warnings like:
% Package Fancyhdr Warning: \headheight is too small (12.0pt): 
%  Make it at least 14.49998pt.
\setlength{\headheight}{15pt}


% Fancier tables
\RequirePackage{booktabs}
% from http://tex.stackexchange.com/questions/4811/make-first-row-of-table-all-bold:
\newcolumntype{$}{>{\global\let\currentrowstyle\relax}}
%$
\newcolumntype{^}{>{\currentrowstyle}}
\newcommand{\rowstyle}[1]{\gdef\currentrowstyle{#1}%
  #1\ignorespaces
}

\newcolumntype{L}{%
  >{\raggedright
    \bfseries
    \boldmath
  }l}%

%\definecolor{lightblue}{RGB}{212,236,244} ---Anne is changing (212,236,244 is lightblue)
\definecolor{dunetablecolor}{RGB}{125,174,211} % matches lighter blue color from Diana's scheme 
\newcommand{\rowtitlestyle}{
%  \rowcolor{lightblue}
  \rowcolor{dunetablecolor}
  \rowstyle{\bfseries \boldmath} 
}

\newcommand{\colhline}{
  \arrayrulecolor{gray}
  \specialrule{0.5pt}{0pt}{1pt}
  \arrayrulecolor{black}
}

\newcommand{\toprowrule}{
  \arrayrulecolor{gray}
  \specialrule{1.2pt}{0pt}{1pt}
  \arrayrulecolor{black}
}

%%% originals come from booktabs
%%% maybe want to customize:
% \renewcommand{\toprule}{
%   \arrayrulecolor{red}
%   \specialrule{1.5pt}{2pt}{0pt}
%   \arrayrulecolor{black}
% }
% \renewcommand{\midrule}{
%   \arrayrulecolor{red}
%   \specialrule{1pt}{1pt}{1pt}
%   \arrayrulecolor{black}
% }
% \renewcommand{\bottomrule}{
%   \arrayrulecolor{red}
%   \specialrule{1.5pt}{0pt}{2pt}
%   \arrayrulecolor{black}
% }


\newcommand{\dunetabtablabel}{}% stores the label
\newcommand{\dunetabcaption}{}% stores the caption
\newcommand{\dunetabcaptionshort}{}% stores an optional short caption
\newenvironment{dunetable}[4][]
{
  \if\relax\detokenize{#1}\relax
  \gdef\dunetabcaptionshort{\relax}
  \else
  \gdef\dunetabcaptionshort{#1}
  \fi

  \gdef\dunetablabel{#3}
  \gdef\dunetabcaption{#4}

  \begin{table}[hbtp]
    \centering
      \caption[\dunetabcaptionshort]{\dunetabcaption}
      \begin{tabular}{#2}
        \toprule
        \rowtitlestyle
}
{
        \bottomrule
      \end{tabular}
      \label{\dunetablabel}
  \end{table}
}

\newcommand{\dunefiglabel}{}% stores the label
\newcommand{\dunefigcaption}{}% stores the caption
\newcommand{\dunefigcaptionshort}{}% stores an optional short caption
\newenvironment{dunefigure}[3][]
{
  \if\relax\detokenize{#1}\relax
  \gdef\dunefigcaptionshort{\relax}
  \else
  \gdef\dunefigcaptionshort{#1}
  \fi

  \gdef\dunefiglabel{#2}
  \gdef\dunefigcaption{#3}

  \begin{figure}[hbtp]
    \centering
}
{
      \caption[\dunefigcaptionshort]{\dunefigcaption}
      \label{\dunefiglabel}
  \end{figure}
}


%
% Provide an "editors note" environment
% 

\definecolor{editornotecolor}{RGB}{255,255,153}
\newenvironment{editornote}
{
  \begin{center}
    \begin{tcolorbox}[width=0.9\textwidth,
	colframe=editornotecolor!130,
	colback=editornotecolor!20!white,
	skin=enhanced]
}      
{
    \end{tcolorbox}
  \end{center}
}



% Hyperref typically needs to come at the end of all \usepackages 
\RequirePackage[pdftex,bookmarks,hidelinks]{hyperref}

% Use to import pdf files (Anne 4/28/15)
\RequirePackage{pdfpages}

% this seems overly tortured
\newif\iffinal

%\finalfalse
\DeclareOption{final}{
  \finaltrue
}
\ProcessOptions\relax

\iffinal
\presetkeys{todonotes}{disable}{}
\newcommand{\hlfix}[2]{}
\newcommand{\fixme}[1]{}
\newcommand{\metainfo}[1]{}
%\linenumbers  %<---- uncomment if you want ONLY linenumbers with otherwise print-ready copy
\else
% "draft"
%Set default style for todonotes
\presetkeys{todonotes}{fancyline}{}
\newcommand{\hlfix}[2]{\texthl{#1}\todo{#2}}
\newcommand{\fixme}[1]{\todo[inline]{#1}}
\newcommand{\metainfo}[1]{\todo[inline,backgroundcolor=yellow]{#1}}

\linenumbers
\fi

%add TOC, TOF, TOT, Ref to TOC (show up in PDF sidebar for easy navigation)
\RequirePackage{tocbibind}

% Use to include authorlist in PDF format
\usepackage{pdfpages}

%for \lesssim symbol
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{amsmath}
\usepackage{cleveref} %To use vref suggested by A Habig Feb 2018
\usepackage{makecell} % To allow linebreaking within table cells (AH Feb 2018)

\usepackage{cprotect}
\usepackage{eurosym}
\usepackage{tfrupee}
\usepackage{textcomp}

