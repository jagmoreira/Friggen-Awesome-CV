\ProvidesClass{friggen-awesome-cv}[2017/06/18 CV class]
\NeedsTeXFormat{LaTeX2e}

% Needed to use a toolbox of programming tools
\RequirePackage{etoolbox}

\DeclareOption{nocolors}{\def\@cv@nocolors{}}

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}

% Add support for A4 paper
\newif\ifafourpaper

\afourpaperfalse

\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}%
    \afourpapertrue%
   }

% Add support for a sidebar
\newbool{sidebar}
\setbool{sidebar}{false}

\DeclareOption{sidebar}{\setbool{sidebar}{true}}

\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{808080}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB3737}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{fblue}{HTML}{3D539E}
\definecolor{tblue}{HTML}{55ACEE}
\definecolor{lblue}{HTML}{0077B5}
\definecolor{vkblue}{HTML}{A6B8D4}

\ifdefined\@cv@nocolors
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fblue}{gray}
  \colorlet{tblue}{gray}
  \colorlet{lblue}{gray}
  \colorlet{vkblue}{gray}
\fi

\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage{fontawesome}
\RequirePackage{unicode-math}

% Configure a directory location for fonts(default: 'fonts/')
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir

% Set the FontAwesome font to be up-to-date.
\newfontfamily\FA[Path=\@fontdir]{FontAwesome}

\newfontfamily\bodyfont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
]{Roboto}
\newfontfamily\thinfont[Path=\@fontdir]{Roboto-Thin}
\newfontfamily\headingfont[Path=\@fontdir]{RobotoCondensed-Bold}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Path=\@fontdir, ItalicFont=*Italic, Mapping=tex-text, Color=textcolor]{Roboto-Light}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%

\RequirePackage{parskip}
\RequirePackage{enumitem}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\or%
        brown\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  %\par\vspace{0.25\baselineskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {\Large\headingfont\color{headercolor} #1}
  %\par\vspace{.25\parskip}%
}

\renewcommand{\subsubsection}[1]{
  \par\vspace{.5\parskip}%
  {\large\headingfont\color{headercolor} #1}
  \par\vspace{.25\parskip}%
}

% Change space before list and before each item
\let\olditemize\itemize
\def\itemize{\vspace{-\baselineskip}\olditemize[leftmargin=0.25in]}


%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{fancyhdr}

% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}
% Clear all header & footer fields
\fancyhf{}

\setlength{\headheight}{54.4pt}

\RequirePackage{tikz}
% Needed to use \ifxetex-\else-\fi statement
\RequirePackage{ifxetex}
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}

% Header spacings
\newcommand{\headerIconSep}{\space\space}
\newcommand{\headerSocialSep}{\quad\textbar\quad}

% Defines writer's mobile (optional)
% Usage: \mobile{<mobile number>}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}

% Defines writer's email (optional)
% Usage: \email{<email adress>}
\newcommand*{\email}[1]{\def\@email{#1}}

% Defines writer's homepage (optional)
% Usage: \homepage{<url>}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}

% Defines writer's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\def\@github{#1}}

% Defines writer's gitlab (optional)
% Usage: \gitlab{<gitlab-nick>}
\newcommand*{\gitlab}[1]{\def\@gitlab{#1}}

% Defines writer's stackoverflow profile (optional)
% Usage: \stackoverflow{<so userid>}{<so username>}
%   e.g.https://stackoverflow.com/users/123456/sam-smith
%       would be \stackoverflow{123456}{sam-smith}
\newcommand*{\stackoverflow}[2]{\def\@stackoverflowid{#1}\def\@stackoverflowname{#2}}

% Defines writer's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}

% Usage: \twitter{<twitter handle>}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}

% Defines writer's skype (optional)
% Usage: \skype{<skype account>}
\newcommand*{\skype}[1]{\def\@skype{#1}}

% Defines writer's reddit (optional)
% Usage: \reddit{<reddit account>}
\newcommand*{\reddit}[1]{\def\@reddit{#1}}

% Defines writer's xing (optional)
% Usage: \xing{<xing name>}
\newcommand*{\xing}[1]{\def\@xing{#1}}


\newcommand{\header}[2]{%
  \fancyhead[C]{%
    {%
      \fontsize{40pt}{1em}\color{headercolor}%
      {\thinfont #1}\quad{\bodyfont #2}%
    }\\
    \vspace{0.35\baselineskip}
    {%
      \bodyfont\color{headercolor}%
      \newbool{isstart}%
      \setbool{isstart}{true}%
      \ifthenelse{\isundefined{\@mobile}}%
        {}%
        {%
          \faMobile\headerIconSep\@mobile%
          \setbool{isstart}{false}%
        }%
      \ifthenelse{\isundefined{\@email}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\headerSocialSep}%
          \href{mailto:\@email}{\faEnvelope\headerIconSep\@email}%
        }%
      \ifthenelse{\isundefined{\@homepage}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\headerSocialSep}%
          \href{http://\@homepage}{\faHome\headerIconSep\@homepage}%
        }%
      \ifthenelse{\isundefined{\@github}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\headerSocialSep}%
          \href{https://github.com/\@github}{\faGithubSquare\headerIconSep\@github}%
        }%
      \ifthenelse{\isundefined{\@gitlab}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\headerSocialSep}%
          \href{https://gitlab.com/\@gitlab}{\faGitlab\headerIconSep\@gitlab}%
        }%
      \ifthenelse{\isundefined{\@stackoverflowid}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\headerSocialSep}%
          \href{https://stackoverflow.com/users/\@stackoverflowid}{\faStackOverflow\headerIconSep\@stackoverflowname}%
        }%
      \ifthenelse{\isundefined{\@linkedin}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\headerSocialSep}%
          \href{https://www.linkedin.com/in/\@linkedin}{\faLinkedinSquare\headerIconSep\@linkedin}%
        }%
      \ifthenelse{\isundefined{\@twitter}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\headerSocialSep}%
          \href{https://twitter.com/\@twitter}{\faTwitter\headerIconSep\@twitter}%
        }%
      \ifthenelse{\isundefined{\@skype}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\headerSocialSep}%
          \faSkype\headerIconSep\@skype%
        }%
      \ifthenelse{\isundefined{\@reddit}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\headerSocialSep}%
          \href{https://www.reddit.com/user/\@reddit}{\faReddit\headerIconSep\@reddit}%
        }%
      \ifthenelse{\isundefined{\@xing}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\headerSocialSep}%
          \href{https://www.xing.com/profile/\@xing}{\faXingSquare\headerIconSep\@xing}
        }%
    }
  }
}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0.005\textwidth}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{lr}
}{%
  \end{tabular*}
}

\renewcommand{\bfseries}{\headingfont\color{headercolor}}

\newcommand{\entry}[4]{%
  \textbf{#1}\\
  {\addfontfeature{Color=lightgray} #2} &%
  {\addfontfeature{Color=lightgray} #3}\\
  \multicolumn{2}{l}{%
    \ifthenelse{\isempty{#4}}%
      {\vspace{-2\parskip}}
      {\parbox[t]{0.98\textwidth}{\hspace{0.25in}#4\vspace{\parsep}}}
    }\\
}

\newcommand{\shortentry}[4]{%
  \textbf{#1} & %
  #2 \hfill {\addfontfeature{Color=lightgray} #3}\\
  \multicolumn{2}{l}{%
    \ifthenelse{\isempty{#4}}%
      {\vspace{-2\parskip}}
      {\parbox[t]{0.98\textwidth}{\hspace{0.25in}#4\vspace{\parsep}}}
    }\\
}

\newcommand{\minientry}[2]{%
  \parbox[t]{0.13\textwidth}{\hfill\textbf{#1}} & %
  \parbox[t]{0.86\textwidth}{#2} \\
}


%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\ifbool{sidebar}{%
  \newenvironment{aside}{%
    \let\oldsection\section
    \renewcommand{\section}[1]{
      {%
        \LARGE\headingfont\color{headercolor}%
        \@sectioncolor ##1%
      }%
      \vspace{0.25\baselineskip}
    }
    \begin{minipage}[t]{0.19\textwidth}%
    \vspace{\parskip}
    \begin{flushright}
    \obeycr
  }{%
    \restorecr
    \end{flushright}
    \let\section\oldsection
    \end{minipage}\hfill
  }
}
{}

%%%%%%%%%%%%%%
% Main Block %
%%%%%%%%%%%%%%

\ifbool{sidebar}{
  \newenvironment{main}{
    \begin{minipage}[t]{0.79\textwidth}%
  }{%
    \end{minipage}
  }
}{%
  \newenvironment{main}{}{}
}


%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

%
%   CURRENTLY BROKEN UNDER THE LATEST VERSION OF biblatex
%

%\RequirePackage[backend=biber, style=verbose, maxnames=99]{biblatex}
%
%\DeclareFieldFormat[article]{title}{\href{\thefield{url}}{#1}}
%\DeclareFieldFormat[inproceedings]{title}{\href{\thefield{url}}{#1}}
%\DeclareFieldFormat[book]{title}{\href{\thefield{url}}{#1}}
%\DeclareFieldFormat[misc]{title}{\href{\thefield{url}}{#1}}
%\DeclareFieldFormat[report]{title}{\href{\thefield{url}}{#1}}
%
%\DeclareBibliographyDriver{article}{%
%  \printfield{title}%
%  \newblock%
%  \printnames{author}%
%  \par%
%  \newblock%
%  {%
%    \footnotesize\addfontfeature{Color=lightgray}\itshape%
%    \usebibmacro{journal+issuetitle}%
%    \setunit{\space}%
%    \printfield{pages}%
%    \newunit%
%    \printlist{publisher}%
%    \setunit*{\addcomma\space}%
%    \printfield{year}%
%    \newunit%
%  }
%  \par\vspace{0.3\baselineskip}
%}
%
%\DeclareBibliographyDriver{book}{%
%  \printfield{title}%
%  \newblock%
%  \printnames{author}%
%  \par%
%  \newblock%
%  {%
%    \footnotesize\addfontfeature{Color=lightgray}\itshape%
%    \printlist{publisher}%
%    \setunit*{\addcomma\space}%
%    \printfield{note}%
%    \setunit*{\addcomma\space}%
%    \printfield{year}%
%    \setunit{\addcomma\space}%
%    \printlist{location}%
%    \newunit%
%  }
%  \par\vspace{0.3\baselineskip}
%}
%
%
%\DeclareBibliographyDriver{inproceedings}{%
%  \printfield{title}%
%  \newblock%
%  \printnames{author}%
%  \par%
%  \newblock%
%  {%
%    \footnotesize\addfontfeature{Color=lightgray}%
%    \printfield{booktitle}%
%    \setunit{\addcomma\space}%
%    \printfield{year}%
%    \setunit{\addcomma\space}%
%    \printlist{location}%
%    \newunit%
%  }
%  \par\vspace{0.3\baselineskip}
%}
%
%\DeclareBibliographyDriver{misc}{%
%  \printfield{title}%
%  \newblock%
%  \printnames{author}%
%  \par%
%  \newblock%
%  {%
%    \footnotesize\addfontfeature{Color=lightgray}\itshape%
%    \printfield{booktitle}%
%    \setunit*{\addcomma\space}%
%    \printfield{note}%
%    \setunit*{\addcomma\space}%
%    \printfield{year}%
%    \setunit{\addcomma\space}%
%    \printlist{location}%
%    \newunit%
%  }
%  \par\vspace{0.3\baselineskip}
%}
%
%\DeclareBibliographyDriver{report}{%
%  \printfield{title}%
%  \newblock%
%  \printnames{author}%
%  \par%
%  \newblock%
%  {%
%    \footnotesize\addfontfeature{Color=lightgray}\itshape%
%    \printfield{type}%
%    \setunit{\space}%
%    \printfield{number}%
%    \setunit{\addcomma\space}%
%    \printfield{year}%
%    \newunit%
%  }
%  \par\vspace{0.3\baselineskip}
%}
%
%
%
%\defbibheading{bibheading}[\bibname]{%
%   \subsubsection*{#1}
%   \markboth{#1}{#1}
%}
%
%\newcommand{\printbibsection}[2]{
%  \begin{refsection}%
%    \newrefcontext[sorting=chronological]%
%    \nocite{*}%
%    \printbibliography[type={#1}, title={#2}, heading=subbibliography]%
%  \end{refsection}
%}
%
%\DeclareSortingScheme{chronological}{
%  \sort[direction=descending]{\field{year}}
%  \sort[direction=descending]{\field{month}}
%}



%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%
\RequirePackage{geometry}
\RequirePackage{hyperref}
\hypersetup{
	hidelinks,
	%colorlinks,
	linkcolor=red,
	citecolor=red,
	filecolor=red,
	urlcolor = blue
}

% A fix for \href{}{} colors not working with fontspec
\makeatletter
\def\HyColor@@@@UseColor#1\@nil{\addfontfeatures{Color=#1}}
\makeatother
