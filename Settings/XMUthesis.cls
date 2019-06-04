\NeedsTeXFormat{LaTeX2e}

\RequirePackage{ expl3 , xparse, xtemplate, l3keys2e }

\RequirePackage{nag}
\ExplSyntaxOn
\def\IfXeTeXTF#1#2{\csname sys_if_engine_xetex:TF\endcsname{#1}{#2}}

\IfXeTeXTF{
%  \PassOptionsToClass{fontset=none}{ctexbook}
  \PassOptionsToPackage{no-math}{fontspec}
  \PassOptionsToPackage{utf8}{inputenc}
  }{}

\sys_if_engine_pdftex:TF {
	\PassOptionsToClass{UTF8}{ctexbook}
		\msg_new:nnn { engine } { msg } { Don't~use~pdfLaTeX~to~compile~the~final~TeX~files.}
		\msg_warning:nn { engine } { msg }
} {}


	
	
\ProvidesClass{ XMUthesis }

\PassOptionsToPackage{subfigure}{tocloft}
\PassOptionsToPackage{noend}{algpseudocode}
\PassOptionsToPackage{para}{threeparttable}
\PassOptionsToPackage{sort&compress}{natbib}

\newif\iffontadvance\fontadvancefalse % for font control

\keys_define:nn { XMUthesis }{
	bibstyle              .choice:                                             ,
	bibstyle              .default:n = super                                   ,
	bibstyle / super      .code:n = \PassOptionsToPackage{super}{gbt7714}      ,
	bibstyle / numbers    .code:n = \PassOptionsToPackage{numbers}{gbt7714}    ,
	bibstyle / authoryear .code:n = \PassOptionsToPackage{authoryear}{gbt7714} ,
	bibstyle / unknown    .code:n = \msg_error:nnxxx { XMUthesis } { unknown-choice } { bibstyle } { super, numbers, authoryear } { The~choice~' #1 '~is~invalid~for~bibstyle	}, 
	
	font           .choice:           ,	
	font           .default:n = empty ,
	font / adobe   .code:n = \PassOptionsToClass{fontset = #1}{ctexbook} ,
	font / fandol  .code:n = \PassOptionsToClass{fontset = #1}{ctexbook} ,
	font / founder .code:n = \PassOptionsToClass{fontset = #1}{ctexbook} ,
	font / mac     .code:n = \PassOptionsToClass{fontset = #1}{ctexbook} ,
	font / macnew  .code:n = \PassOptionsToClass{fontset = #1}{ctexbook} ,
	font / macold  .code:n = \PassOptionsToClass{fontset = #1}{ctexbook} ,
	font / windows .code:n = \PassOptionsToClass{fontset = #1}{ctexbook} ,
	font / ubuntu  .code:n = \PassOptionsToClass{fontset = #1}{ctexbook} 
		\msg_new:nnn { ubuntu font } { msg } {
			You~are~using~the~default~fonts,~so~you~better~change~it~by~font=adobe,~or~advance.~If~you~choose~them,~you~should~download~the~necessary~font~and~put~them~in~the~right~palce.
			}
			\msg_warning:nn { ubuntu font } { msg },
	font / advance  .code:n    = \PassOptionsToClass{fontset =none}{ctexbook}
	\fontadvancetrue,
	font / empty    .code:n    = \msg_new:nnn { font } { msg } {
		You~are~using~the~default~fonts,~you~can~change~it~by~font=adobe,~windows,~mac,~advance~and~so~on.
		}
		\msg_warning:nn { font } { msg },
	font / unknown  .code:n = \msg_error:nnxxx { XMUthesis } { unknown-choice }
	{ font }{ empty, adobe, fandol, founder, mac, macnew, macold, ubuntu, windows, advance }{ The~choice~' #1 '~is~invalid~for~font },
}

\ProcessKeysOptions { XMUthesis }


\LoadClass [ 12pt, openright,  ] {ctexbook} % twoside,

\sys_if_engine_pdftex:TF {\RequirePackage{microtype,amsfonts}} {}

\RequirePackage
  {
    amsmath        ,
    amsthm         ,
    physics        ,
    siunitx        ,
    verbatim       ,
    multirow       ,
    geometry       ,
    fancyhdr       ,
    footmisc       ,
    graphicx       ,
    longtable      ,
    booktabs       ,
    tabularx       ,
    caption        ,
    threeparttable ,
    subfig         ,
    tocloft        ,
    xcolor         ,
    listings       ,
    setspace       ,
    pifont         ,
    tikz           ,
    float          ,
    gbt7714        ,
%    natbib        ,
    hyperref       ,
    algorithm      ,
    algpseudocode  ,
    cleveref       ,
    }

\IfXeTeXTF{
\RequirePackage{unicode-math}
\setmainfont{Times~New~Roman}  % Times~New~Roman  Source~Serif~Pro
\setsansfont{Arial}            % Arial  Source~Sans~Pro

\unimathsetup{
  math-style = ISO     ,
  bold-style = ISO     ,
  nabla      = upright ,
  partial    = upright ,
  }
}{}

\geometry{	
	left   = 2cm ,
	right  = 2cm ,
	top    = 4cm ,
	bottom = 3cm ,
	}  
\captionsetup{font={small,bf}}
\hypersetup{
%	bookmarks=true            ,
	bookmarksnumbered = false ,
	linkcolor         = black ,
	citecolor         = blue  ,
	urlcolor          = green ,
	colorlinks                ,
	}

  
\keys_if_exist:nnTF { XMUthesis } { bibstyle } { 
	\RequirePackage[sort&compress]{natbib}
	\RequirePackage{gbt7714} 
	} { }

\iffontadvance

%\keys_if_choice_exist:nnnTF { XMUthesis } { font } { advance }  {
	  \setmonofont[
	    Extension          = .otf      ,
		Path               = fonts/    ,
		UprightFont        = *-regular ,
	    BoldFont           = *-bold    ,
	    ItalicFont         = *-it      ,
	    BoldItalicFont     = *-boldit] {SourceCodePro}	
	  \setCJKmonofont[
		Extension          = .otf      ,
	    Path               = fonts/    ,
	    UprightFont        = *-Regular ,
	    BoldFont           = *-Bold    ,
	    ItalicFont         = *-Regular ,
	    BoldItalicFont     = *-Bold    ,
	    ItalicFeatures     = FakeSlant ,
	    BoldItalicFeatures = FakeSlant] {NotoSansMonoCJKsc}  
	  \setCJKmainfont[
		Extension          = .otf      ,
	    Path               = fonts/    ,
	    UprightFont        = *-Regular ,
	    BoldFont           = *-Bold    ,
	    ItalicFont         = *-Regular ,
	    BoldItalicFont     = *-Bold    ,
	    ItalicFeatures     = FakeSlant ,
	    BoldItalicFeatures = FakeSlant] {NotoSerifCJKsc}
	  \setCJKsansfont[
		Extension          = .otf      ,
	    Path               = fonts/    ,
	    UprightFont        = *-Regular ,
	    BoldFont           = *-Bold    ,
	    ItalicFont         = *-Regular ,
	    BoldItalicFont     = *-Bold    ,
	    ItalicFeatures     = FakeSlant ,
	    BoldItalicFeatures = FakeSlant] {NotoSansCJKsc}
	  \setmathfont[
	    Extension    	   = .otf          ,
	    Path               = fonts/        ,
	    BoldFont           = XITSMath-Bold ,
	    StylisticSet       = 8] {XITSMath-Regular}
%	    } { }

\fi 
  

\newcommand{\xiaochu}{\fontsize{30pt}{40pt}\selectfont}     % 小初   , 1.5倍行距
\newcommand{\yihao}{\fontsize{26pt}{36pt}\selectfont}       % 一号   , 1.4倍行距
\newcommand{\erhao}{\fontsize{22pt}{28pt}\selectfont}       % 二号   , 1.25倍行距
\newcommand{\xiaoer}{\fontsize{18pt}{18pt}\selectfont}      % 小二   , 单倍行距
\newcommand{\sanhao}{\fontsize{16pt}{24pt}\selectfont}      % 三号   , 1.5倍行距
\newcommand{\xiaosan}{\fontsize{15pt}{22pt}\selectfont}     % 小三   , 1.5倍行距
\newcommand{\sihao}{\fontsize{14pt}{21pt}\selectfont}       % 四号   , 1.5倍行距
\newcommand{\banxiaosi}{\fontsize{13pt}{19pt}\selectfont}   % 半小四 , 1.5倍行距
\newcommand{\xiaosi}{\fontsize{12pt}{18pt}\selectfont}      % 小四   , 1.5倍行距
\newcommand{\dawuhao}{\fontsize{11pt}{11pt}\selectfont}     % 大五号 , 单倍行距
\newcommand{\wuhao}{\fontsize{10.5pt}{10.5pt}\selectfont}   % 五号   , 单倍行距
\newcommand{\xiaowu}{\fontsize{9pt}{9pt}\selectfont}        % 小五号 , 单倍行距
  
\sys_if_engine_pdftex:TF {\usepackage{microtype}} {}


\makeatletter

\renewcommand{\chaptermark}[1]{\markboth{#1}{#1}}
\fancyhf{}  % cleans original header&footer
\fancyhead[CE]{\xiaowu \xmutitle}
\fancyhead[CO]{\xiaowu \leftmark }  %\leftmark \chaptermark
\fancyfoot[C]{\thepage}

\renewcommand{\headrulewidth}{0pt}
\let\oldmainmatter\mainmatter

\renewcommand\mainmatter{\oldmainmatter\renewcommand{\headrulewidth}{1pt}}


\ctexset{
	today          =	big,  % format date
	bibname        =	{参考文献},
	contentsname   =	{},
	chapter        = 	{
	format         = 	\centering\xiaosan\sffamily,
	beforeskip     = 	-15pt,
	afterskip      = 	30pt,
	pagestyle      =  	fancy,},%
	section        = 	{
		format     = 	\sihao\sffamily,
		beforeskip = 	10pt,
		afterskip  = 	10pt,
						},
	subsection 	   = 	{
		format     = 	\xiaosi\sffamily,
						},
}


\newlistof{indice}{tce}{}
\setlength{\cftbeforetcetitleskip}{-30pt}

\setlength{\cftbeforechapskip}{12pt}
\setlength{\cftbeforesecskip}{10pt}
\setlength{\cftbeforesubsecskip}{5pt}
\setlength{\cftbeforetoctitleskip}{-30pt}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}} % for chapters
\renewcommand{\cftchapfont}{\sihao\sffamily}% Chapter font
\renewcommand{\cftsecfont}{\xiaosi\sffamily}% Section font 
\renewcommand{\cftsubsecfont}{\xiaosi\rmfamily}%subsection font
\renewcommand{\cfttoctitlefont}{\hfill\xiaosan\sffamily \phantom{mmmmmmmmm} 目\quad 录\hfill}
\renewcommand{\cftaftertoctitle}{\hfill}

\renewcommand{\cfttcetitlefont}{\hfill\xiaosan\rmfamily\bfseries \phantom{mmmmmmm}Table~of~Contents\hfill}
\renewcommand{\cftaftertcetitle}{\hfill}

\newcommand\captce[1]{%
\if@mainmatter
   \addcontentsline{tce}{chapter}{
    \rmfamily\bfseries \protect\makebox[5em][l]{Chapter~\thechapter}#1}
    \else
       \addcontentsline{tce}{chapter}{
\rmfamily\bfseries\protect\makebox[0em][l]{}#1}
\fi 
    }

\newcommand\sectce[1]{%
   \addcontentsline{tce}{section}{ \rmfamily\bfseries\protect\makebox[2.8em][l]{\thesection}#1}}
\newcommand\ssectce[1]{%
\addcontentsline{tce}{subsection}{\protect\makebox[3em][l]{\thesubsection}#1}}


\let\oldchapter\chapter
\RenewDocumentCommand\chapter{ s m g }
{
\IfBooleanTF  {#1}
{ \oldchapter*{#2} \IfNoValueF {#3} {#3}}
{ \oldchapter{#2} \IfNoValueF {#3} {\captce{#3} }}
}

\let\oldsection\section
\RenewDocumentCommand\section{ s m g }
{
\IfBooleanTF  {#1}
{ \oldsection*{#2} \IfNoValueF {#3} {#3}}
{ \oldsection{#2} \IfNoValueF {#3} {\sectce{#3} }}
}

\let\oldsubsection\subsection
\RenewDocumentCommand\subsection{ s m g }
{
\IfBooleanTF  {#1}
{ \oldsubsection*{#2} \IfNoValueF {#3} {#3}}
{ \oldsubsection{#2} \IfNoValueF {#3} {\ssectce{#3} }}
}

\let\origdoublepage\cleardoublepage
\newcommand{\clearemptydoublepage}{%
  \clearpage
  {\pagestyle{empty}\origdoublepage}%
}
\let\cleardoublepage\clearemptydoublepage


\NewDocumentCommand\xmutableofcontents{}{
\cleardoublepage
\tableofcontents
\cleardoublepage
\listofindice
}

\makeatother


% --------------------------- resources settings ----------------------
\graphicspath{{Figures/},{../Figures/}, } %设定图片的存放路径

% --------------------------- circled text settings ----------------------
% required package(s):
% - tikz
\newcommand*\circled[1]{\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {#1}}}}
%\newcommand*{\circled}[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt] (char) {#1};}}
%%\newcommand*\circled[1]{\tikz[baseline=(char.base)]{
%            \node[shape=circle,draw,inner sep=2pt] (char) {#1};}}  % define a new command for circled text since \textcircled is very sloppy

% --------------------------- endnotes settings ----------------------
% required package(s):
% - pifont
\renewcommand\thefootnote{\ding{\numexpr171+\value{footnote}}} %改变注脚的格式

% --------------------------- code inserting settings ----------------------
% required package(s):
% - listings
\def\lstbasicfont{\fontfamily{pcr}\selectfont\footnotesize}
\lstset{%
	numbers=left,
	numberstyle=\tiny,
	basicstyle=\small,
	backgroundcolor=\color{white},      % choose the background color
	basicstyle=\footnotesize\ttfamily,  % size of fonts used for the code
	columns=fullflexible,
	tabsize=4,
	breaklines=true,               % automatic line breaking only at whitespace
	captionpos=b,                  % sets the caption-position to bottom
	commentstyle=\color{green},  % comment style
	escapeinside={\%*}{*)},        % if you want to add LaTeX within your code
	keywordstyle=\color{blue},     % keyword style
	stringstyle=\color{purple}\ttfamily,  % string literal style
	frame=single,
	rulesepcolor=\color{red!20!green!20!blue!20},
}
\lstloadlanguages{C,C++,Java,Matlab,Mathematica}  % supported languages

% --------------------------- algorithm inserting settings ----------------------
% required packages:
% - algorithm
% - algpseudocode[noend]
\makeatletter
\def\algbackskip{\hskip-\ALG@thistlm} %\def\BState{\State\hskip-\ALG@thistlm} % both works fine, but latter one redefines \BState

\renewcommand\maketitle{\thispagestyle{empty}
\begin{center}
\vskip \stretch{4}
\includegraphics[width=8cm]{xmu-flag}\\
\vskip \stretch{4}

   {\rmfamily   \xiaoer %\bfseries
   	 \the\degree  \quad 毕\quad 业\quad 论\quad 文\quad （~设\quad 计~）
%   	 \quad 综\quad 述\quad 与\quad 翻\quad 译   
}\\ \vskip \stretch{2} 
   {\rmfamily   \sanhao %\bfseries
   （\the\majorordouble） \\
} \vskip \stretch{3}

   {\sffamily  \erhao %\bfseries
		 \xmutitle 
}\vskip \stretch{3}

	{ \rmfamily \bfseries \sanhao
		 \the\englishtitle
}\vskip \stretch{2}
	
	\vskip \stretch{1}
	{ \rmfamily \sihao % \sffamily \heiti 
		\begin{tabular}{rl} 
			姓\qquad 名： & \xmuauthor \\
			学\qquad 号： & \the\studentnumber \\
			学\qquad 院： & \the\department \\
			专\qquad 业： & \the\major \\
			年\qquad 级： & \the\class \\
			校内指导教师： & \the\advisor \\
			校外指导教师： & \the\otheradvisor\\
		\end{tabular}%
	}
	\vskip \stretch{2}
	\rmfamily\mdseries\sihao
	\vskip \stretch{5.5}
	\xmudate
	\vskip \stretch{2}
\end{center}
}

\makeatother





% --------------------------- reference settings ------------------------
% required packages:
% - cleveref
% \crefname params: 
% first: type
% second: singular cross reference
% third: plural cross reference
\renewcommand{\citep}[1]{{\color{blue}\citeauthor{#1}(\citeyearpar{#1})}}
\crefformat{figure}{#2图#1#3}
\crefrangeformat{figure}{图(#3#1#4)\;$\sim$\;(#5#2#6)}
\crefmultiformat{figure}{图~(#2#1#3)}{和~(#2#1#3)}{，(#2#1#3)}{和~(#2#1#3)}

\crefformat{table}{#2表#1#3}
\crefrangeformat{table}{表(#3#1#4)\;$\sim$\;(#5#2#6)}
\crefmultiformat{table}{表~(#2#1#3)}{和~(#2#1#3)}{，(#2#1#3)}{和~(#2#1#3)}

\crefformat{equation}{公式(#2#1#3)}
\crefrangeformat{equation}{公式(#3#1#4)\;$\sim$\;(#5#2#6)}
\crefmultiformat{equation}{公式~(#2#1#3)}{ 和~(#2#1#3)}{，(#2#1#3)}{ 和~(#2#1#3)}
% equation, chapter, section, etc.
% \creflabelformat{htypei}{hformati}

% --------------------------- equations&principles settings ------------------------
% required packages:
% - amsthm
\newtheorem{theory}{定理}[section]
\newtheorem{law}{定律}[section]
\theoremstyle{definition}


%%============================关键词===========================%%

%%中文关键词。
\newcommand\keywords[1]{%
	\vspace{2ex}\noindent{\sffamily \bfseries 关键词：} #1}


%%英文关键词。
\newcommand\englishkeywords[1]{%
\noindent{\sffamily \bfseries Keywords:~} #1} %	\vspace{2ex}
	

%\newtoks\xmudate
%\newtoks\xmuauthor
%\newtoks\xmutitle
\newtoks\class
\newtoks\studentnumber
\newtoks\department
\newtoks\major
\newtoks\advisor
\newtoks\otheradvisor
\newtoks\team
\newtoks\fundteam
\newtoks\degree
\newtoks\englishtitle
\newtoks\majorordouble
\newtoks\lab
