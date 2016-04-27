% Cette classe {memoire} doit son existence à la classe {bredele}
% réalisée par Christophe Masutti.
% <http://linuxetleschoses.tuxfamily.org/Logiciels/bredele.php>
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>
 
 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{memoire}[03/06/2011]
 
\LoadClass[oneside,12pt,a4paper]{report} % En tripatouillant on peut utiliser {book}
 
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{titling}
\RequirePackage{titletoc}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{enumitem}

% Fonte sympathique
\RequirePackage{fourier}
 
% Interligne 1.5 par défaut pour tout le document
\RequirePackage{setspace}
\onehalfspacing
 
% Notes de bas de page continues
\RequirePackage{chngcntr}
\counterwithout{footnote}{chapter}
 
%\RequirePackage{hyphenat}
% Contrôler par une option le choix de la césure
\newif\if@cesure\@cesurefalse
\DeclareOption{sanscesure}{\@cesuretrue}
\ProcessOptions\relax
 
\if@cesure
  \RequirePackage[none]{hyphenat}
  \sloppy
\fi
 
 
% Guillemets français dans la biblio
\RequirePackage{csquotes}
 
% On est en sciences humaines…
\RequirePackage[latin,polutonikogreek,francais]{babel}
 
 
% On met tout en noir, sans quoi ça déstabilise le quidam
\RequirePackage[pdftex=true,hyperindex=true, colorlinks=true, linkcolor=black, citecolor=black, filecolor=black, urlcolor=black, bookmarks=true] {hyperref}
 
% On utilise biblatex et ses belles possibilités pour la biblio, plus biber (Texlive 2011+)
\RequirePackage[backend=biber,hyperref,style=verbose-trad2,useauthor=true, useeditor=false]{biblatex}
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%        Bibliographie
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%% Redéfinir les mots-clefs pour la biblio, et ajouter un "art. cit."
 
\DefineBibliographyStrings{french}{
opcit = \iffieldequalstr{entrytype}{article}{art\adddotspace cit\adddot}{\emph{op\adddotspace cit}\adddot},
idem = {\emph{idem}},
ibidem = {\emph{ibid\adddot}},
byeditor = {\'ed\adddotspace \smartof{} },%
}
 
 
% Virgules au lieu de points dans la biblio.
\renewcommand*{\newunitpunct}{\addcomma\space}
 
%%% Tripoter le style standard pour avoir une virgule au lieu de deux points avant la date.
\renewbibmacro*{publisher+location+date}{%
\printlist{location}%
\iflistundef{publisher}
{\setunit*{\addspace}}
{\setunit*{\addcomma\space}}%
\printlist{publisher}%
\setunit*{\addcomma\space}%
\printfield{year}%
\newunit
} 
 
%% Il est possible de redéfinir des sections dans la biblio 
% Exemple :
%\defbibheading{corpus}{\subsection*{-A- Textes du corpus}}
 
% Pour faire des titres à l'apparence plus convenable.
\renewcommand\thechapter{\Roman{chapter}}
\titleformat{\chapter}[hang]{\bf\huge}{\thechapter}{2pc}{} 
 
\renewcommand\thechapter{\Roman{chapter}}
\renewcommand\thesection{- \Alph{section} -}
\renewcommand\thesubsection{\arabic{subsection}.}
\renewcommand\thesubsubsection{\alph{subsubsection}}

 
 
%%%% Vers. Usage :
% \begin{vers}[optionnel:incrément]{obligatoire:lignedébut}
% blabla
% \end{vers}
 
\RequirePackage{verse}
 
\newenvironment{vers}[2][2]{%
\begin{minipage}{11cm}%
\begin{verse}%
\small%
\poemlines{#1}%
\setverselinenums{#2}{0}}{\end{verse}\end{minipage}}
 
 
%%%% Citations avec interligne simple
% Copyright (C) 2002 Mike Nolta <mrnolta@princeton.edu>, GPL V. 2.0 and
% later version. http://www.physics.princeton.edu/cosmology/computing/PrincetonThesis.cls
 
\let\oldquotation=\quotation
\let\oldendquotation=\endquotation
\renewenvironment{quotation}
   {\singlespacing\oldquotation}
   {\oldendquotation}
 
\let\oldquote=\quote
\let\oldendquote=\endquote
\renewenvironment{quote}
   {\singlespacing\oldquote}
   {\oldendquote}
%%%%%%
