\def\RCSfile{rcci}%
\def\RCSversion{1.0b}%
\def\RCSdate{2014/07/22}%

%-------------------------------------------------------
% Definiciones Constantes
%-------------------------------------------------------
\def\@journal{Revista Cubana de Ciencias Inform{\'a}ticas} 
\def\@company{Universidad de las Ciencias Inform{\'a}ticas. La Habana, Cuba}
\def\@editorial{Grupo Editorial \textquotedblleft Ediciones Futuro\textquotedblright}
\def\@issn{2227-1899}
\def\@rnps{2301}
\def\@shortjid{rcci}
\def\@journalweb{\url{http://rcci.uci.cu}}
\def\@journalmail{\href{mailto:rcci@uci.cu}{\nolinkurl{rcci@uci.cu}}}

%-------------------------------------------------------
% Definiciones Variables
%-------------------------------------------------------
% Revista
\def\@volume{x}
\def\@no{x}
\def\@month{x-y}
\def\@year{z}
\def\@pages{x-y}
% Artículo
\def\recibido{dd/mm/aa}
\def\aceptado{dd/mm/aa}
\def\publicado{dd/mm/aa}

%------------------------------------------------------- 
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{\@shortjid}

\let\if@noauthor\iftrue
\DeclareOption{noauthor}{\let\if@noauthor\iffalse}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions

\LoadClass[11pt]{article}

%-------------------------------------------------------
% Idioma ESPAÑOL
%-------------------------------------------------------
\RequirePackage[spanish,activeacute]{babel}
\RequirePackage[ansinew]{inputenc}

%-------------------------------------------------------
% Paquetes para fórmulas, ecuaciones y símbolos matemáticos
%-------------------------------------------------------
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{latexsym}

%-------------------------------------------------------
% Paquetes para figuras
%-------------------------------------------------------
\RequirePackage[dvips]{graphicx}
\RequirePackage[justification=centering, font=small]{caption}
\captionsetup{labelsep=period, belowskip=1em}

%-------------------------------------------------------
% Paquetes para bibliografia
%-------------------------------------------------------
%\RequirePackage[round, authoryear]{natbib}

%-------------------------------------------------------
% Paquetes para tablas
%-------------------------------------------------------
\RequirePackage[para]{threeparttable}
\usepackage{etoolbox}
\appto\TPTnoteSettings{\footnotesize}
%-------------------------------------------------------
% Configuración de bloque de autores
%-------------------------------------------------------
\RequirePackage{authblk}
\renewcommand{\Authsep}{, }
\renewcommand{\Authand}{, }
\renewcommand{\Authands}{, }

%-------------------------------------------------------
% Configuración de titulos de secciones y subsecciones
%-------------------------------------------------------
\RequirePackage{titlesec}
\titlespacing{\section}{0pt}{16pt}{*-1.5}
\titleformat{\section}
	{\normalfont\fontsize{14}{14}\bfseries}{\thesection}{0em}{}
\titlespacing{\subsection}{0pt}{12pt}{*-1.5}
\titleformat{\subsection}
	{\normalfont\fontsize{12}{12}\bfseries}{\thesubsection}{0em}{}
\titleformat{\subsubsection}
	{\normalfont\fontsize{12}{12}\bfseries}{\thesubsection}{0em}{}	

%-------------------------------------------------------
% Configuración de vínculos
%-------------------------------------------------------
\RequirePackage[bookmarks=true, colorlinks=true, linkcolor=red, citecolor=blue, urlcolor=blue]{hyperref}
\RequirePackage{xcolor}

%-------------------------------------------------------
% Configuración de página y márgenes
%-------------------------------------------------------
\RequirePackage[letterpaper,headheight=3.81cm, top=3.81cm, bottom=3.81cm, left=2cm, right=1.2cm]{geometry}
\setlength\parindent{0pt}
\RequirePackage{setspace}

%-------------------------------------------------------
% Configuración de cabecera y pie de página
%-------------------------------------------------------
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\lhead{{\fontsize{9}{10}\selectfont \textcolor{gray}{\@journal \\
Vol. \@volume, No. \@no, Mes \@month, \@year \\
ISSN: \@issn\ \textbar\ RNPS: \@rnps\\
Pág. \@pages \\}
\vskip -0.5em
\@journalweb}}
\rfoot{\thepage}
\lfoot{\textcolor{gray}{\@editorial\\
\@company\\}
\@journalmail}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

%-------------------------------------------------------
% Configuración del resumen
%-------------------------------------------------------
\renewenvironment{abstract}{%
\vskip -1em
\par\noindent\rule{\textwidth}{0.5pt}
\vskip 1em
{\raggedright\textbf\abstractname\\ \par\noindent}}
{\par\noindent\rule{\textwidth}{0.5pt}}

%-------------------------------------------------------
% Configuración de título del artículo
%-------------------------------------------------------
\def\titlefont{\fontsize{18}{20}\selectfont\raggedright\textbf}
\def\authorfont{\fontsize{11}{11}\selectfont\raggedright}

\makeatletter
\let\ps@plain\ps@fancy 
\renewcommand\@maketitle{%
\vskip -1em
{\par\noindent{\fontsize{11pt}{11pt}\selectfont Tipo de artículo: \tipoarticulo\\
Temática: \tematica\\
Recibido: \recibido\ \textbar\ Aceptado: \aceptado\ \textbar\ Publicado: \publicado\\}}
\vskip 0.5em
{\par\noindent \titlefont\@title \par\noindent }
\vskip 0.5em
{\par\noindent \textit{\titlefont\englistitle} \par\noindent }
\vskip 1em
\if@noauthor
{\par\noindent \authorfont\@author \par\noindent}
\vskip -0.5em
{\par\noindent {\fontsize{11pt}{11pt}\selectfont $^*$Autor para correspondencia: \authormail} \par\noindent}
\fi
}
\makeatother

%-------------------------------------------------------
% Configuración de comandos
%-------------------------------------------------------
\def\keywordname{{\bf Palabras claves:}}
\providecommand{\keywords}[1]{\par\addvspace\baselineskip
\noindent\keywordname\enspace\ignorespaces#1}

\def\englishabstractname{\bf Abstract}
\providecommand{\englishabstract}[1]{\par\addvspace\baselineskip
\noindent\englishabstractname\enspace\ignorespaces\\\it#1}

\def\englishkeywordname{{\bf Keywords:}}
\providecommand{\englishkeywords}[1]{\par\addvspace\baselineskip
\noindent\englishkeywordname\enspace\ignorespaces#1}

\newtheorem{definition}{\sc Definición}

\addto\captionsspanish{%
  \renewcommand\tablename{Tabla}
}

\def\theoremname{Teorema}

\DeclareMathSymbol{\Gamma}{\mathalpha}{letters}{"00}
\DeclareMathSymbol{\Delta}{\mathalpha}{letters}{"01}
\DeclareMathSymbol{\Theta}{\mathalpha}{letters}{"02}
\DeclareMathSymbol{\Lambda}{\mathalpha}{letters}{"03}
\DeclareMathSymbol{\Xi}{\mathalpha}{letters}{"04}
\DeclareMathSymbol{\Pi}{\mathalpha}{letters}{"05}
\DeclareMathSymbol{\Sigma}{\mathalpha}{letters}{"06}
\DeclareMathSymbol{\Upsilon}{\mathalpha}{letters}{"07}
\DeclareMathSymbol{\Phi}{\mathalpha}{letters}{"08}
\DeclareMathSymbol{\Psi}{\mathalpha}{letters}{"09}
\DeclareMathSymbol{\Omega}{\mathalpha}{letters}{"0A}

\setlength\footnotesep{7.7pt}
\let\footnotesize\small

\long\def\@makecaption#1#2{%
  \small
  \vskip\abovecaptionskip
  \sbox\@tempboxa{{\bfseries #1.} #2}%
  \ifdim \wd\@tempboxa >\hsize
    {\bfseries #1.} #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

\def\fps@figure{htbp}
\def\fnum@figure{\figurename\thinspace\thefigure}
\def \@floatboxreset {%
        \reset@font
        \small
        \@setnobreak
        \@setminipage
}
%\def\fps@table{htbp}
%\def\fnum@table{\tablename~\thetable}
%\renewenvironment{table}
%               {\setlength\abovecaptionskip{0\p@}%
%                \setlength\belowcaptionskip{10\p@}%
%                \@float{table}}
%               {\end@float}
%\renewenvironment{table*}
%               {\setlength\abovecaptionskip{0\p@}%
%                \setlength\belowcaptionskip{10\p@}%
%                \@dblfloat{table}}
%               {\end@dblfloat}
%
%\long\def\@caption#1[#2]#3{\par\addcontentsline{\csname
%  ext@#1\endcsname}{#1}{\protect\numberline{\csname
%  the#1\endcsname}{\ignorespaces #2}}\begingroup
%    \@parboxrestore
%    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
%  \endgroup}
