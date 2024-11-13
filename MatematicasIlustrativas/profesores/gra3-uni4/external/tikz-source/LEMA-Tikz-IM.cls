\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{LEMA-Tikz-IM}

% The convert command is to automatically convert the pdf
% to svg with 1.5 scale and to png with 300 density
% One needs to run pdflatex with -shell-escape for it to work
% Needs:
%  - rsvg-convert (brew install librsvg) 
%  - imageMagick (brew install imagemagick)
%  - pdf2svg (brew install pdf2svg)
\LoadClass[border=5pt, tikz, convert={command=\unexpanded{{pdf2svg \infile\space "\jobname.svg" && rsvg-convert --zoom 1.5 --format svg --output "\jobname.svg" "\jobname.svg" && convert -density 300 \infile\space "\jobname.png"}}}]{standalone}


\RequirePackage{pgf}       % for floating point arithmetic arithmetic
\RequirePackage{fix-cm}    % allow for arbitrary font sizes using fix-cm


% Opciones dependiendo del grado (por ejemplo, tamaño de la fuente)
% Ejemplo: \documentclass[grado3]{LEMA-IM}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Código para ajustar la fuente dependiento del grado
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Default scaling factor
\newcommand{\myscalefactor}{1}

% Declare options for each grade level, adjusting the scale factor
\DeclareOption{grado0}{\renewcommand{\myscalefactor}{2.0}}  % 200% scale
\DeclareOption{grado1}{\renewcommand{\myscalefactor}{1.7}}  % 170% scale
\DeclareOption{grado2}{\renewcommand{\myscalefactor}{1.5}}  % 150% scale
\DeclareOption{grado3}{\renewcommand{\myscalefactor}{1.3}}  % 130% scale
\DeclareOption{grado4}{\renewcommand{\myscalefactor}{1.1}}  % 110% scale
\DeclareOption{grado5}{\renewcommand{\myscalefactor}{1.0}}  % 100% scale
\DeclareOption{grado6}{\renewcommand{\myscalefactor}{1.0}}  % 100% scale
\DeclareOption{grado7}{\renewcommand{\myscalefactor}{1.0}}  % 100% scale
\DeclareOption{grado8}{\renewcommand{\myscalefactor}{1.0}}  % 100% scale
\DeclareOption{grado9}{\renewcommand{\myscalefactor}{1.0}}  % 100% scale
\DeclareOption{grado10}{\renewcommand{\myscalefactor}{1.0}}  % 100% scale
\DeclareOption{grado11}{\renewcommand{\myscalefactor}{1.0}}  % 100% scale
\DeclareOption{profe}{\renewcommand{\myscalefactor}{1.0}}   % 100% scale


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{standalone}}
\ProcessOptions\relax


% Separate scaling for each font size category
% Default size is set at 12pt, and scaling goes from there.
\newcommand{\setscaledfonts}{
  \pgfmathparse{11 * \myscalefactor}\let\normalsizevalue\pgfmathresult
  \pgfmathparse{13 * \myscalefactor}\let\normalsizebaselineskip\pgfmathresult

  \pgfmathparse{12 * \myscalefactor}\let\largevalue\pgfmathresult
  \pgfmathparse{14.4 * \myscalefactor}\let\largebaselineskip\pgfmathresult

  \pgfmathparse{14 * \myscalefactor}\let\Largevalue\pgfmathresult
  \pgfmathparse{17 * \myscalefactor}\let\Largebaselineskip\pgfmathresult

  \pgfmathparse{17 * \myscalefactor}\let\LARGEvalue\pgfmathresult
  \pgfmathparse{20 * \myscalefactor}\let\LARGEbaselineskip\pgfmathresult

  \pgfmathparse{25 * \myscalefactor}\let\Hugevalue\pgfmathresult
  \pgfmathparse{30 * \myscalefactor}\let\Hugebaselineskip\pgfmathresult

  \pgfmathparse{9 * \myscalefactor}\let\smallvalue\pgfmathresult
  \pgfmathparse{10.8 * \myscalefactor}\let\smallbaselineskip\pgfmathresult

  \pgfmathparse{8 * \myscalefactor}\let\footnotesizevalue\pgfmathresult
  \pgfmathparse{9.6 * \myscalefactor}\let\footnotesizebaselineskip\pgfmathresult

  \pgfmathparse{6 * \myscalefactor}\let\scriptsizevalue\pgfmathresult
  \pgfmathparse{7.2 * \myscalefactor}\let\scriptsizebaselineskip\pgfmathresult

  \pgfmathparse{5 * \myscalefactor}\let\tinyvalue\pgfmathresult
  \pgfmathparse{6 * \myscalefactor}\let\tinybaselineskip\pgfmathresult

  % Apply the computed sizes
  \renewcommand\normalsize{\fontsize{\normalsizevalue pt}{\normalsizebaselineskip pt}\selectfont}
  \renewcommand\large{\fontsize{\largevalue pt}{\largebaselineskip pt}\selectfont}
  \renewcommand\Large{\fontsize{\Largevalue pt}{\Largebaselineskip pt}\selectfont}
  \renewcommand\LARGE{\fontsize{\LARGEvalue pt}{\LARGEbaselineskip pt}\selectfont}
  \renewcommand\Huge{\fontsize{\Hugevalue pt}{\Hugebaselineskip pt}\selectfont}
  \renewcommand\small{\fontsize{\smallvalue pt}{\smallbaselineskip pt}\selectfont}
  \renewcommand\footnotesize{\fontsize{\footnotesizevalue pt}{\footnotesizebaselineskip pt}\selectfont}
  \renewcommand\scriptsize{\fontsize{\scriptsizevalue pt}{\scriptsizebaselineskip pt}\selectfont}
  \renewcommand\tiny{\fontsize{\tinyvalue pt}{\tinybaselineskip pt}\selectfont}

  % Ensure \normalsize is applied
  \normalsize
}



\AtBeginDocument{%
    \setscaledfonts % Apply the custom font size 
}



\typeout{Enrique Acosta - 2024}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Style defs below
%% can be moved out into LEMA-Tikz-IM.sty if desired
%% would be loaded as \RequirePackage{LEMA-Tikz-IM}
%% Benefit of having it all in one file is that it can be invoked from 
%% different directories without path or dependency issues (managing separate 
%% files in different directories can lead to issues like LaTeX not finding 
%% the .sty file. A unified .cls eliminates this problem.)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage{tikz}
\RequirePackage{pgfplots}
\RequirePackage{amsmath}
\RequirePackage{xcolor}

% \RequirePackage{sansmath}
\RequirePackage{sfmath}
\renewcommand{\familydefault}{\sfdefault}

% \RequirePackage[fontsize=10pt]{fontsize}
% \gradeFontSize

% \RequirePackage[default,scale=0.95]{opensans}
% \RequirePackage[T1]{fontenc}
\usetikzlibrary{
    fit,
    calc,
    intersections,
    % positioning,
    % arrows,
    % arrows.meta,
    % shapes.geometric,
    % shapes,
    matrix,
    % shapes.symbols,
    % backgrounds,
    % decorations,
    % decorations.pathreplacing,
    % decorations.pathmorphing,
    % decorations.markings,
    % arrows,
    % patterns,
    % fillbetween,
}


% Default font used to be set for all nodes, but now is set in LEMA-Tikz-IM.cls
% \tikzset{every node/.append style={font=\gradeFontSize\sansmath}} %\gradeFontSize defined in LEMA-Tikz-IM.cls

% Default line style
\tikzset{every picture/.append style={line join=round}}
\tikzset{every picture/.append style={line width=0.75pt}}


%%%%%%%%%%%%%%%%%%%
% Dot groups
%%%%%%%%%%%%%%%%%%%
% inner sep = 0pt guarantees size is exactly minimum size (otherwise a space may be added, which grows with lower grades).
\def\midDotSize{2ex} % en unidades [ex] para ajustarse al tamaño de la fuente
\tikzstyle{midDot}=[circle, draw, fill=cyan!60, minimum size = \midDotSize, inner sep = 0pt] 
\tikzstyle{midDotRoundedRect}=[draw, rectangle, rounded corners=0.5*\midDotSize, inner sep=3*\midDotSize/10]

% ------------------------------------------
% Usage: \midDotGroup[rotate=30, shift={(1,3)}]{x-num}{y-num}
% Creates named coordinates (dot-2-3) 
\newcommand{\midDotGroup}[3][]{
  \begin{scope}[#1]
      \foreach \x in {1,...,#2}{
        \foreach \y in {1,...,#3}{
          \node[midDot, xshift=\x*1.3*\midDotSize, yshift=\y*1.3*\midDotSize] 
               (dot-\x-\y) at (0,0) {};
        }
      }
      % Rounded box around all the dots
      \node[midDotRoundedRect=0.6*\midDotSize, fit=(dot-1-1) (dot-#2-#3)] (roundedRect) {};
  \end{scope}
}


%%%%%%%%%%%%%%%%%%%
% Dice
%%%%%%%%%%%%%%%%%%%
% Adjust \diceDotSize to change the size of all the dice. The dice edge is computed from \diceDotSize
% inner sep = 0pt guarantees size is exactly minimum size (otherwise a space may be added, which grows with lower grades).
\def\diceDotSize{\midDotSize}
\tikzstyle{diceDot}=[circle, draw, fill=cyan!60, minimum size = \diceDotSize, inner sep = 0pt]
% ------------------------------------------
% Usage: \diceThree[shift={(5*\diceDotSize,0)}]
% WARNING: Make sure to always use shifts in terms of \diceDotSize so that \diceDotSize can be changed without breaking all the figures.
% Extras:
% -  Creates named coordinates (dot-2-3)
%     * (dot-1-1) is bottom left
%     * (dot-3-1) is bottom right
% -  Creates named node for the edge of the dice (diceEdge)
% -  Example:
%    \diceThree
%    \node[above] at (diceEdge.north) {hello};

\newcommand{\drawDiceDotsAndEdgeFor}[1]{
  % center dot is at (0,0)
  % (dot-1-1) is bottom left
  % (dot-3-1) is bottom right
  \foreach \x/\y in {#1}{
    \node[diceDot] (dot-\x-\y) at ({(\x-2)*1.3*\diceDotSize},{(\y-2)*1.3*\diceDotSize}) {};
  }
  % Dice Edge
  \node[draw, 
        rectangle, 
        rounded corners=0.5*\diceDotSize, 
        minimum width=4.3*\diceDotSize, 
        minimum height=4.3*\diceDotSize,
        ] (diceEdge) at (0,0) {};
}

\newcommand{\diceThree}[1][]{
  \begin{scope}[#1]
    \drawDiceDotsAndEdgeFor{1/1,2/2,3/3}
  \end{scope}
}

\newcommand{\diceFive}[1][]{
  \begin{scope}[#1]
    \drawDiceDotsAndEdgeFor{1/1,2/2,3/3,1/3,3/1}
  \end{scope}
}

\newcommand{\diceSix}[1][]{
  \begin{scope}[#1]
    \drawDiceDotsAndEdgeFor{1/1,1/2,1/3,3/1,3/2,3/3}
  \end{scope}
}

\newcommand{\diceTwo}[1][]{
  \begin{scope}[#1]
    \drawDiceDotsAndEdgeFor{1/1,3/3}
  \end{scope}
}

\newcommand{\diceFour}[1][]{
  \begin{scope}[#1]
    \drawDiceDotsAndEdgeFor{1/1,3/3,1/3,3/1}
  \end{scope}
}

\newcommand{\diceOne}[1][]{
  \begin{scope}[#1]
    \drawDiceDotsAndEdgeFor{2/2}
  \end{scope}
}



%%%%%%%%%%%%%%%%%%%
% Tablas
%%%%%%%%%%%%%%%%%%%
% Las celdas son nodes rectangulares
% Notación \matrix[tablaVertical, OPCIONES] (myTable) { contenido-de-tabla };
% Cada celda recibe un nombre, de la forma (myTable-<row>-<column>)
% Por ejemplo, 
%     - fila 1 y columna 5 es la coordenada (myTable-1-5)
%     - la parte de abajo de la fila 2 y col 6 es (myTable-1-5.south)
%     - la esquina de abajo a la derecha (myTable-1-5.south east)
% Ejemplo:
% \matrix[tablaVertical, % ver def en LEMA-Tikz-IM.sty
%         row 1/.append style={nodes={minimum height=9ex}},
%         column 1/.append style={nodes={text width = 3cm}},
%         column 2/.append style={nodes={text width = 5cm}},
%         column 3/.append style={nodes={text width = 2cm}},
%         column 4/.append style={nodes={text width = 4.5cm}},
%     ] (myTable) {
%         % Header Row 
%         {número total de manzanas} & 
%         {número de manzanas que no están en cajas} & 
%         {número de cajas} & 
%         {número de manzanas\\en cada caja}\\
%         % 
%         3  & 4    &  & 7\\ 
%         3  & hola & 1 & 0\\ 
%   };

\def\minTableColWidth{20ex}
\def\minTableRowHeight{5ex}
\def\tableLineWidth{1pt}
\def\tableHeaderLineWidth{2pt}
\definecolor{tableBlack}{RGB}{0,0,0}   % uses \RequirePackage{xcolor}
\definecolor{tableGray}{RGB}{50,50,50} % \RequirePackage{xcolor}

% TikZ matrix style
\tikzset{
  tablaVertical/.style={
    matrix of nodes,
    nodes in empty cells,
    row sep=-\tableLineWidth,
    column sep=-\tableLineWidth,
    inner sep=0pt,
    outer sep=0pt,
    nodes={
      rectangle,
      text width=\minTableColWidth,
      minimum height=\minTableRowHeight,
      inner xsep= 0.2cm,
      inner ysep= 0.2cm,
      align=center,
      anchor=center,
      draw,
      line width=\tableLineWidth,
      draw=tableGray,
    },
    % Header row font override
    row 1/.append style={nodes={font={\bfseries}}},
    % Header row thick border (column sep needs to be redefined so that all columns in table don't separate)
    row 1/.append style={column sep=-\tableHeaderLineWidth, nodes={line width=\tableHeaderLineWidth}},
  }
}