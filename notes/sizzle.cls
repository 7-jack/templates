%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% setup 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sizzle}[2025/01/13]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% options 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Anonymous author, default false
\newif\ifanon
\anonfalse
\DeclareOption{anon}{\anontrue}

% Date in top left corner, default false
\newif\ifnodate
\nodatefalse
\DeclareOption{nodate}{\nodatetrue}

% Deal with unknown options 
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}

% Execute options code
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% preamble 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Base class, uses KOMA-Script with spaces between paragraphs.
\LoadClass[parskip]{scrartcl}

% Language
\RequirePackage[english]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage{microtype}

% Math
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{thmtools}

\RequirePackage{mathrsfs}
\RequirePackage{textcomp}
\RequirePackage{multirow}
\RequirePackage{mathtools}
\RequirePackage{microtype}
\RequirePackage{stmaryrd}

% Title stuff
\RequirePackage{titling}
\setlength{\droptitle}{-2cm}

% Center title, author, and date with sans serif font
\pretitle{\begin{center}\sffamily\bfseries\LARGE}
\preauthor{\begin{center}
    \large\sffamily \lineskip 0.5em%
    \begin{tabular}[t]{c}}
\predate{\begin{center}\sffamily\large}

% Defaults, can be overwritten
\ifanon
    \author{}
\else
    \author{Jack Cheng}
\fi
\date{\today}

% Load colors
\RequirePackage[dvipsnames]{xcolor}
\newcommand{\accentcolor}{\color{black}}

% Page geometry
\RequirePackage{geometry}
\geometry{
    left=26mm,
    right=26mm,
    top=26mm,
    bottom=26mm,
    headsep=5mm,
}

% For header
\usepackage[headsepline]{scrlayer-scrpage}
\automark{section}
\automark*{subsection}
\clearpairofpagestyles
\ihead{\headmark} % Display section/subsection in top left
\ohead{\pagemark} % Display page count in top right

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% more packages 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% For tables
\RequirePackage{booktabs}
\renewcommand{\arraystretch}{1.05}

% For links
\RequirePackage[
    colorlinks = true,
    linkcolor = blue,
    urlcolor  = blue,
    citecolor = blue,
    anchorcolor = blue,
    destlabel = true]{hyperref}
\RequirePackage[nameinlink]{cleveref}

% Graphs
\RequirePackage{tikz}

% Better enumerations
\RequirePackage{enumerate}

% Listings (code)
\RequirePackage{listings}
\lstset{
    basicstyle=\small\sffamily,
    numbers=left,
    numberstyle=\tiny,
    frame=tb,
    columns=fullflexible,
    showstringspaces=false
}

\RequirePackage{fontawesome}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% environments 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[framemethod=TikZ]{mdframed}

% skip above/below patch
\makeatletter
\xpatchcmd{\endmdframed}
  {\aftergroup\endmdf@trivlist\color@endgroup}
  {\endmdf@trivlist\color@endgroup\@doendpe}
  {}{}
\makeatother

% BLUE
\mdfdefinestyle{mdbluebox}{%
    linewidth=2pt,
    linecolor=NavyBlue,
    rightline=false, topline=false, bottomline=false,
    backgroundcolor=NavyBlue!5,
    innerbottommargin=10,
    nobreak=true, % Page breaking
    skipabove=12pt,
    skipbelow=0pt,
}
\declaretheoremstyle[
    headfont=\sffamily\bfseries\color{NavyBlue!70!black},
    mdframed={style=mdbluebox},
    headpunct={\\[5pt]},
]{thmbluebox}

% RED
\mdfdefinestyle{mdredbox}{%
    linewidth=2pt,
    linecolor=RawSienna,
    rightline=false, topline=false, bottomline=false,
    backgroundcolor=RawSienna!5,
    innerbottommargin=10,
    nobreak=true, % Page breaking
    skipabove=12pt,
    skipbelow=0pt,
}
\declaretheoremstyle[
    headfont=\sffamily\bfseries\color{RawSienna!70!black},
    mdframed={style=mdredbox},
    headpunct={\\[5pt]},
]{thmredbox}

% LIGHT RED
\mdfdefinestyle{mdlightredbox}{%
    linewidth=2pt,
    linecolor=RawSienna,
    rightline=false, topline=false, bottomline=false,
    backgroundcolor=RawSienna!1,
    innerbottommargin=10,
}
\declaretheoremstyle[
    headfont=\sffamily\bfseries\color{RawSienna!70!black},
    mdframed={style=mdlightredbox},
    headpunct={\\[5pt]},
    qed=\qedsymbol
]{thmlightredbox}

% GREEN
\mdfdefinestyle{mdgreenbox}{%
    linewidth=2pt,
    linecolor=ForestGreen,
    rightline=false, topline=false, bottomline=false,
    backgroundcolor=ForestGreen!5,
    innerbottommargin=10,
    nobreak=true, % Page breaking
    skipabove=12pt,
    skipbelow=0pt,
}
\declaretheoremstyle[
    headfont=\sffamily\bfseries\color{ForestGreen!70!black},
    mdframed={style=mdgreenbox},
    headpunct={\\[5pt]},
]{thmgreenbox}

\mdfdefinestyle{mdgreenboxbreakable}{%
    linewidth=2pt,
    linecolor=ForestGreen,
    rightline=false, topline=false, bottomline=false,
    backgroundcolor=ForestGreen!5,
    innerbottommargin=10,
    nobreak=false, % Page breaking
    skipabove=12pt,
    skipbelow=0pt,
}
\declaretheoremstyle[
    headfont=\sffamily\bfseries\color{ForestGreen!70!black},
    mdframed={style=mdgreenboxbreakable},
    headpunct={\\[5pt]},
]{thmgreenboxbreakable}

% PURPLE
\mdfdefinestyle{mdpurplebox}{%
    linewidth=2pt,
    rightline=false, topline=false, bottomline=false,
    linecolor=RoyalPurple,
    backgroundcolor=RoyalPurple!5,
    innerbottommargin=10,
    nobreak=true, % Page breaking
    skipabove=12pt,
    skipbelow=0pt,
}
\declaretheoremstyle[
    headfont=\bfseries\sffamily\color{RoyalPurple!70!black},
    bodyfont=\normalfont,
    headpunct={\\[5pt]},
    mdframed={style=mdpurplebox},
]{thmpurplebox}

% BLACK
\mdfdefinestyle{mdblackbox}{%
    linewidth=2pt,
    rightline=false, topline=false, bottomline=false,
    linecolor=black,
    backgroundcolor=RedViolet!5!gray!5,
    nobreak=true,
    skipabove=12pt,
    skipbelow=0pt,
}
\declaretheoremstyle[
    headfont=\bfseries,
    bodyfont=\normalfont\small,
    spaceabove=0pt,
    spacebelow=0pt,
    mdframed={style=mdblackbox},
]{thmblackbox}

\newcommand{\listhack}{$\empty$\vspace{-2em}}

\theoremstyle{definition}
\declaretheorem[style=thmredbox,name=Theorem,numberwithin=section]{theorem}

\declaretheorem[style=thmbluebox, name=Definition, sibling=theorem]{definition}
\declaretheorem[style=thmbluebox, name=Definition, numbered=no]{definition*}

\declaretheorem[style=thmredbox,name=Theorem,numbered=no]{theorem*}
\declaretheorem[style=thmredbox,name=Lemma,sibling=theorem]{lemma}
\declaretheorem[style=thmredbox,name=Lemma,numbered=no]{lemma*}
\declaretheorem[style=thmredbox,name=Proposition,sibling=theorem]{proposition}
\declaretheorem[style=thmredbox,name=Proposition,numbered=no]{proposition*}
\declaretheorem[style=thmredbox,name=Corollary,sibling=theorem]{corollary}
\declaretheorem[style=thmredbox,name=Corollary,numbered=no]{corollary*}
\declaretheorem[style=thmredbox,name=Claim,sibling=theorem]{claim}
\declaretheorem[style=thmredbox,name=Claim,numbered=no]{claim*}

\declaretheorem[style=thmlightredbox,name=Proof,sibling=theorem]{replacementproof}
\renewenvironment{proof}[1][\proofname]{\vspace{-10pt}\begin{replacementproof}}{\end{replacementproof}}

\declaretheorem[style=thmgreenboxbreakable,name=Example,sibling=theorem]{example}
\declaretheorem[style=thmgreenboxbreakable,name=Example,numbered=no]{example*}
    
\declaretheorem[style=thmblackbox,name=Remark,sibling=theorem]{remark}
\declaretheorem[style=thmblackbox,name=Remark,numbered=no]{remark*}
\declaretheorem[style=thmblackbox, name=Conjecture,sibling=theorem]{conjecture}
\declaretheorem[style=thmblackbox, name=Conjecture,numbered=no]{conjecture*}

\declaretheorem[name=Exercise,sibling=theorem]{exercise}
\declaretheorem[name=Exercise,numbered=no]{exercise*}
\declaretheorem[name=Fact,sibling=theorem]{fact}
\declaretheorem[name=Fact,numbered=no]{fact*}
\declaretheorem[name=Problem,sibling=theorem]{problem}
\declaretheorem[name=Problem,numbered=no]{problem*}
\declaretheorem[name=Question,sibling=theorem,style=thmblackbox]{ques}
\declaretheorem[name=Question,numbered=no]{ques*}

% Clever references
\Crefname{claim}{Claim}{Claims}
\Crefname{conjecture}{Conjecture}{Conjectures}
\Crefname{exercise}{Exercise}{Exercises}
\Crefname{fact}{Fact}{Facts}
\Crefname{problem}{Problem}{Problems}
\Crefname{ques}{Question}{Questions}

% Fancy section and chapter heads
\addtokomafont{partprefix}{\rmfamily}
\renewcommand*{\partformat}{\accentcolor
    \scalebox{2.5}{\thepart}\enlargethispage{2em}}
\renewcommand*{\sectionformat}%
{\accentcolor\S\thesection\enskip}
\renewcommand*{\subsectionformat}%
{\accentcolor\S\thesubsection\enskip}
\renewcommand*{\subsubsectionformat}%
{\accentcolor\S\thesubsubsection\enskip}
\KOMAoptions{numbers=noenddot}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% macros 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Math
\newcommand{\C}{\mathbb C}
\newcommand{\G}{\mathbb G}
\newcommand{\F}{\mathbb F}
\newcommand{\N}{\mathbb N}
\newcommand{\Q}{\mathbb Q}
\newcommand{\R}{\mathbb R}
\newcommand{\Z}{\mathbb Z}

\newcommand{\CC}{\mathcal C}
\newcommand{\GG}{\mathcal G}
\newcommand{\FF}{\mathcal F}
\newcommand{\NN}{\mathcal N}
\newcommand{\QQ}{\mathcal Q}
\newcommand{\RR}{\mathcal R}
\newcommand{\ZZ}{\mathcal Z}
\newcommand{\MM}{\mathcal M}
\newcommand{\KK}{\mathcal K}
\renewcommand{\AA}{\mathcal A} % No idea where \AA is already defined...

\DeclareMathOperator{\csimeq}{\overset{c}{\simeq}}

% Crypto
\newcommand{\sampledfrom}{\leftarrow}
\DeclareMathOperator{\Gen}{\mathsf{Gen}}
\DeclareMathOperator{\Enc}{\mathsf{Enc}}
\DeclareMathOperator{\Dec}{\mathsf{Dec}}
\DeclareMathOperator{\EncScheme}{(\Gen, \Enc, \Dec)}
\DeclareMathOperator{\Sign}{\mathsf{Sign}}
\DeclareMathOperator{\Mac}{\mathsf{Mac}}
\DeclareMathOperator{\Verify}{\mathsf{Verify}}
\DeclareMathOperator{\negligible}{\mathsf{negligible}}

\newcommand{\eqline}{\noalign{\smallskip} \hline \noalign{\smallskip}}
\newcommand{\PPT}{\mathrm{PPT}}

% Inserting graphics in a nice way
\newcommand{\Graphic}[2]{
    \begin{center}
        \includegraphics[width=#2\textwidth]{#1}
    \end{center}
}

% Vocabulary
\newcommand{\vocab}[1]{\textbf{#1}}

