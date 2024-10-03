\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{igrmkcv}[2024/09/23 igrmkCV v1.0.0, yet another LaTeX CV/Résumé class, loosly based on AltaCV class.]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax
\LoadClass{extarticle}

\RequirePackage[a-1b]{pdfx}
\RequirePackage[margin=2cm]{geometry}
\RequirePackage{fontspec}
\RequirePackage{tikz}
\RequirePackage[skins]{tcolorbox} % Needed for `fill overzoom image` feature
\RequirePackage[inline]{enumitem}

\usetikzlibrary{arrows}

\linespread{1.18}
\sloppy
\pagestyle{empty}
\raggedright
\setlist{leftmargin=*,labelsep=0.5em,nosep,itemsep=0.15\baselineskip,after=\vspace{0.25\baselineskip}}
\setlist[itemize]{label={\small\textbullet}}
\setlength{\parindent}{0pt}
\pagenumbering{gobble}

\definecolor{secondaryTextColor}{RGB}{115, 115, 115}
\colorlet{secondaryTextColor}{secondaryTextColor}
\definecolor{accentColor}{RGB}{40, 102, 225}
\colorlet{accentColor}{accentColor}
\definecolor{outlineColor}{RGB}{213, 213, 213}
\colorlet{outlineColor}{outlineColor}
\newcommand{\cvPersonIcon}{\raisebox{-0.1pt}{\includegraphics[height=7.5pt]{graphics/user-solid.pdf}}}
\newcommand{\cvExperienceIcon}{\raisebox{-0.5pt}{\includegraphics[height=7.5pt]{graphics/briefcase-solid.pdf}}}
\newcommand{\cvRatingMarker}{}
\newcommand{\cvMarkerSpacing}{}
\newcommand{\cvSetRating}[2]{%
    \renewcommand{\cvRatingMarker}{#1}
    \renewcommand{\cvMarkerSpacing}{#2}
}
\cvSetRating
    {\raisebox{1.7pt}{\tikz \fill[rounded corners=1pt] (0,0) rectangle (4.9pt, 2.4pt);}}
    {1.5pt}

\newenvironment{fullwidth}{%
    \begin{adjustwidth}{}{\dimexpr-\marginparwidth-\marginparsep\relax}}
    {\end{adjustwidth}}

\newcommand{\makeCvHeader}[3]{%
    \def\name{#1}
    \def\photo{#2}
    \def\tagline{#3}
    \begingroup
        \begin{minipage}{1.5cm}%
            \tikz
            \path[rounded corners=0.3cm, fill overzoom image={\photo}]rectangle(1.5cm, 1.5cm);
        \end{minipage}%
        \hspace{0.5cm}%
        \begin{minipage}{\dimexpr\linewidth-2cm}%
            \raggedright%
            {%
                \LARGE%
                \bfseries%
                \name%
                \par%
            }%
            \smallskip
            {%
                \large
                \tagline
                \par
            }
        \end{minipage}%
        \par%
    \endgroup\medskip
}

\newcommand{\cvLeftSection}[2]{%
    \makeatletter
    \@startsection{section}
        {1}
        {0pt}
        {12pt}
        {3pt}
        {\normalfont\Large\bfseries}
        *{%
            #1\hspace{0.16cm}#2
        }%
    \makeatother
}

\newcommand{\cvRightSection}[1]{%
    \makeatletter
    \@startsection{section}
        {1}
        {0pt}
        {12pt}
        {2pt}
        {\normalfont\large\bfseries}
        *{#1}
    \makeatother
}

\newcommand{\cvLeftEvent}[5]{%
    \def\title{#1}
    \def\company{#2}
    \def\date{#3}
    \def\location{#4}
    \def\link{#5}

    \makeatletter
    \@startsection{section}
        {2}
        {0pt}
        {4pt}
        {2pt}
        {\normalfont\normalsize}
        *{%
            \textbf{\title}%
            \normalsize
            \color{secondaryTextColor}
            \ifx\company\empty\else\hspace{3pt}at \company\fi
            \ifx\location\empty\else, \location\fi
            \color{secondaryTextColor}
            \ifx\date\empty\else{\\\small\date}\fi
            \ifx\link\empty\else{\\\small\link}\fi
        }%
    \makeatother
}

\newcommand{\cvRightEvent}[4]{%
    \def\title{#1}
    \def\company{#2}
    \def\date{#3}
    \def\location{#4}

    \makeatletter
    \@startsection{section}
        {2}
        {0pt}
        {4pt}
        {6pt} % Increased spacing as these events occur consecutively without intervening text
        {\normalfont\normalsize}
        *{%
            \title%
            \color{secondaryTextColor}
            \ifx\company\empty\else\\\company\fi
            \ifx\location\empty\else, \location\fi
            \color{secondaryTextColor}
            \ifx\date\empty\else{\\\small\date}\fi
        }%
    \makeatother
}

\newcommand{\cvTag}[1]{%
    \allowbreak%
    \tikz[baseline]
    \node[
        anchor=base,
        draw=outlineColor,
        rounded corners,
        inner xsep=0.75ex,
        inner ysep=0.7ex,
        text height=1.5ex,
        text depth=.25ex
    ]{#1};%
    \hspace{1.2pt}%
    \ignorespaces%
}

\newcommand{\cvSkill}[2]{%
    #1\hfill
    \foreach \x in {1,...,5}{%
        {%
            \ifnum \x > #2
                \color{outlineColor}%
            \else
                \color{accentColor}%
            \fi
            \cvRatingMarker%
            \hspace{\cvMarkerSpacing}%
        }%
    }%
    \par%
}
