%------------------------------------------------------------------------------
% Custom Poster Class for PHARM
%
% by Kyle Daruwalla (daruwalla@wisc.edu)
% 
% Rev 0 as of 2017-02-15
%------------------------------------------------------------------------------

%\def\fileversion{0.0}
%\def\filedate{2017-02-13}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pharmposter}

\RequirePackage{ifthen}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{a0size}
\RequirePackage{xcolor}
\RequirePackage{multicol}

% Define UW colors
\definecolor{badgerred}{cmyk}{0.03, 1, 0.66, 0.12}

% Define lengths
\newlength{\pharmposter@paperheight}
\newlength{\pharmposter@paperwidth}
\newlength{\pharmposter@headerheight}
\newif\if@portrait
\newcommand{\pharmposter@setpapersize}[3]{
\if@portrait
	\setlength{\pharmposter@paperwidth}{#1}
	\setlength{\pharmposter@paperheight}{#2}
\else
	\setlength{\pharmposter@paperwidth}{#2}
	\setlength{\pharmposter@paperheight}{#1}
\fi
\setlength{\pharmposter@headerheight}{#3}
}

% Declare options
\DeclareOption{portrait}{\@portraittrue}
\DeclareOption{landscape}{\@portraitfalse}
\DeclareOption{ArchD}{\pharmposter@setpapersize{24in}{36in}{4in}}
\DeclareOption{ArchE}{\pharmposter@setpapersize{36in}{48in}{6in}}
\ExecuteOptions{landscape,ArchE}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% Error in renewing lengths with tcolorbox
\RequirePackage[most]{tcolorbox}

% Set page size
\usepackage[
	paperwidth=\pharmposter@paperwidth,
	paperheight=\pharmposter@paperheight,
	headheight=\pharmposter@headerheight,
	bottom=1in,
	lmargin=1in,
	rmargin=1in,
]{geometry}
\setlength{\columnsep}{1in}
\setlength{\headsep}{1in}

% Define font sizes
\renewcommand{\tiny}{\fontsize{12}{14}\selectfont}
\renewcommand{\scriptsize}{\fontsize{14.4}{18}\selectfont}   
\renewcommand{\footnotesize}{\fontsize{17.28}{22}\selectfont}
\renewcommand{\small}{\fontsize{20.74}{25}\selectfont}
\renewcommand{\normalsize}{\fontsize{24.88}{30}\selectfont}
\renewcommand{\large}{\fontsize{29.86}{37}\selectfont}
\renewcommand{\Large}{\fontsize{35.83}{45}\selectfont}
\renewcommand{\LARGE}{\fontsize{43}{54}\selectfont}
\renewcommand{\huge}{\fontsize{51.6}{64}\selectfont}
\renewcommand{\Huge}{\fontsize{61.92}{77}\selectfont}
\newcommand{\veryHuge}{\fontsize{74.3}{93}\selectfont}
\newcommand{\VeryHuge}{\fontsize{89.16}{112}\selectfont}
\newcommand{\VERYHuge}{\fontsize{107}{134}\selectfont}

% Set header and footer
\pagestyle{fancy}
\renewcommand{\headrule}{\color{badgerred}%
  \makebox[0pt][l]{%
    \rule[-0.1\baselineskip]{\linewidth}{5pt}}%
    \rule[-0.5\baselineskip]{\linewidth}{5pt}%
}
\lhead{\hspace*{-1in}\raisebox{-0.5\height}{\includegraphics[height=0.7\pharmposter@headerheight]{red-flush-UWlogo.pdf}}}
\chead{\raisebox{-0.5\height}{
	\parbox{0.6\textwidth} {
		{\begin{center} \sffamily \bfseries \VeryHuge \@title \end{center}}
}}}
\rhead{\raisebox{-0.5\height}{
	\parbox{0.17\textwidth} {
		{\begin{flushright} \sffamily \Huge \@author \end{flushright}}
	}
	\hspace{0.01\textwidth}
}}
\lfoot{}\cfoot{}\rfoot{}

% Create section boxes
\newenvironment{sectionbox}[1]
{\begin{tcolorbox}[breakable,colback=white,colframe=badgerred,boxrule=1mm,titlerule=4mm,toptitle=1mm,title={\LARGE #1}]}
{\end{tcolorbox} \vspace{0.25in} \vfill}

\AtBeginDocument{
	\Large
	\sffamily
	\if@portrait
		\begin{multicols}{2}
	\else
		\begin{multicols}{3}
}

\AtEndDocument{
	\end{multicols}
}

\endinput