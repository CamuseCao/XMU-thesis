% !TEX root = ../XMU.tex
\NeedsTeXFormat{LaTeX2e}

\RequirePackage{ expl3, xparse, xtemplate, l3keys2e, scrlfile }

\RequirePackage[l2tabu, orthodox]{nag}
\ExplSyntaxOn
\def\IfXeTeXTF#1#2{\csname sys_if_engine_xetex:TF\endcsname{#1}{#2}}

\IfXeTeXTF{
	% \PassOptionsToClass{fontset=none}{ctexbook}
	\PassOptionsToPackage{no-math}{fontspec}
	\PassOptionsToPackage{utf8}{inputenc}
}{}

\sys_if_engine_pdftex:T {
	\PassOptionsToClass{UTF8}{ctexbook}
		\msg_new:nnn { engine } { msg } { Don't~use~pdfLaTeX~to~compile~the~final~TeX~files.}
		\msg_warning:nn { engine } { msg }
}




\ProvidesClass{ XMUthesis }

\PassOptionsToPackage{subfigure}{tocloft}
\PassOptionsToPackage{noend}{algpseudocode}
\PassOptionsToPackage{para}{threeparttable}
\PassOptionsToPackage{sort&compress}{natbib}

\bool_set_false:N \l__xmu_advanced_font_bool

\keys_define:nn { XMUthesis }{
	bibstyle                  .choice:               ,
	bibstyle                  .default:n = numerical ,
	bibstyle / numerical      .code:n =                                                                 ,
	bibstyle / numbers        .code:n = \AfterPackage{gbt7714}{\citestyle{numbers}}                     ,
	bibstyle / authoryear     .code:n = \AfterPackage{gbt7714}{\bibliographystyle{gbt7714-author-year}} ,
	bibstyle / unknown        .code:n = \msg_error:nnxxx { XMUthesis } { unknown-choice } { bibstyle }  
						{ numerical, numbers, authoryear } { The~choice~' #1 '~is~invalid~for~bibstyle} ,

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
			You~are~using~the~default~fonts,~so~you~better~change~it~by~font=adobe,
			~or~advance.~If~you~choose~them,
			~you~should~download~the~necessary~font~and~put~them~in~the~right~place.
			}
			\msg_warning:nn { ubuntu font } { msg },
	font / advance  .code:n    = \PassOptionsToClass{fontset =none}{ctexbook}
	\bool_set_true:N \l__xmu_advanced_font_bool,
	font / empty    .code:n    = \msg_new:nnn { font } { msg } {
		You~are~using~the~default~fonts,~you~can~change~it~by~font=adobe,
		~windows,~mac,~advance~and~so~on.
		}
		\msg_warning:nn { font } { msg },
	font / unknown  .code:n = \msg_error:nnxxx { XMUthesis } { unknown-choice }{ font }{
		empty, adobe, fandol, founder, mac, macnew, macold, ubuntu, windows, advance 
		}{ 
			The~choice~' #1 '~is~invalid~for~font 
	},
}

\ProcessKeysOptions { XMUthesis }


\LoadClass [ zihao=-4 , openright,  ] {ctexbook}

\sys_if_engine_pdftex:T {
	\RequirePackage{microtype,amsfonts}
}

\RequirePackage{
    amsthm         ,
    physics        ,
    siunitx        ,
    verbatim       ,
    multirow       ,
    geometry       ,
    fancyhdr       ,
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
	gbt7714		   ,
    float          ,
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


\bool_if:NT \l__xmu_advanced_font_bool{
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
}





\makeatletter
\RenewDocumentCommand\chaptermark{m}{\markboth{#1}{#1}}

\fancyhf{}  % cleans original header&footer
\fancyhead[CE]{\zihao{-5} \l__xmu_title_tl}
\fancyhead[CO]{\zihao{-5} \leftmark}  %\leftmark \chaptermark
\fancyfoot[C]{\thepage}

\RenewDocumentCommand\headrulewidth{}{0pt}


\ctexset{
	today          =	big,  % format date
	bibname        =	{参考文献},
	contentsname   =	{},
	chapter        = 	{
	format         = 	\centering\zihao{-3}\sffamily,
	beforeskip     = 	-15pt,
	afterskip      = 	30pt,
	pagestyle      =  	fancy,},%
	section        = 	{
		format     = 	\zihao{4}\sffamily,
		beforeskip = 	10pt,
		afterskip  = 	10pt,
						},
	subsection 	   = 	{
		format     = 	\zihao{-3}\sffamily,
						},
}


\newlistof{indice}{tce}{}
\setlength{\cftbeforetcetitleskip}{-30pt}
\setlength{\cftbeforechapskip}{12pt}
\setlength{\cftbeforesecskip}{10pt}
\setlength{\cftbeforesubsecskip}{5pt}
\setlength{\cftbeforetoctitleskip}{-30pt}
\RenewDocumentCommand\cftchapleader{}{\cftdotfill{\cftdotsep}} % for chapters
\RenewDocumentCommand\cftchapfont{}{\zihao{4}\sffamily}% Chapter font
\RenewDocumentCommand\cftsecfont{}{\zihao{-3}\sffamily}% Section font 
\RenewDocumentCommand\cftsubsecfont{}{\zihao{-3}\rmfamily}%subsection font
\RenewDocumentCommand\cfttoctitlefont{}{\hfill\zihao{-3}\sffamily  目\quad 录\hfill}%\phantom{mmmmmmmmm}
\RenewDocumentCommand\cftaftertoctitle{}{\hfill}
\RenewDocumentCommand\cfttcetitlefont{}{\hfill\zihao{-3}\rmfamily\bfseries Table~of~Contents\hfill}%\phantom{mmmmmmm}
\RenewDocumentCommand\cftaftertcetitle{}{\hfill}

\NewDocumentCommand\captce { m } {
\if@mainmatter
	\addcontentsline{tce}{chapter}{
		\rmfamily\bfseries \protect\makebox[5em][l]{Chapter~\thechapter}#1}
    \else
		\addcontentsline{tce}{chapter}{
\rmfamily\bfseries\protect\makebox[0em][l]{}#1}
\fi 
}

\NewDocumentCommand\sectce { m } {
	\addcontentsline{tce}{section}{
		\rmfamily\bfseries\protect\makebox[2.8em][l]{\thesection}#1
	}
}

\NewDocumentCommand\ssectce { m } {
	\addcontentsline{tce}{subsection}{
		\protect\makebox[3em][l]{\thesubsection}#1
	}
}


\let\oldchapter\chapter
\RenewDocumentCommand\chapter{ s m g }{
	\IfBooleanTF {#1} {
		\oldchapter*{#2}
		\IfNoValueF {#3} {#3}
	}{
			\oldchapter{#2}
			\IfNoValueF {#3} {
				\captce{#3} 
		}
	}
}

\let\oldsection\section
\RenewDocumentCommand\section{ s m g }{
	\IfBooleanTF  {#1}{
		\oldsection*{#2} 
		\IfNoValueF {#3} {#3}
	}{
		\oldsection{#2}
		\IfNoValueF {#3} {
			\sectce{#3}
		}
	}
}

\let\oldsubsection\subsection
\RenewDocumentCommand\subsection{ s m g }{
	\IfBooleanTF  {#1}{
		\oldsubsection*{#2} 
		\IfNoValueF {#3} {#3}
	}{
		\oldsubsection{#2}
		\IfNoValueF {#3} {
			\ssectce{#3} 
		}
	}
}

\let\origdoublepage\cleardoublepage
\NewDocumentCommand\clearemptydoublepage{}{
	\clearpage
	{\pagestyle{empty}\origdoublepage}
}

\let\cleardoublepage\clearemptydoublepage


\NewDocumentCommand\xmutableofcontents{}{
	\cleardoublepage
	\tableofcontents
	\cleardoublepage
	\listofindice
	\mainmatter
	\RenewDocumentCommand\headrulewidth{}{1pt}
}

\makeatother


% --------------------------- resources settings ----------------------
\graphicspath{{Figures/},{../Figures/}, } %设定图片的存放路径

% --------------------------- circled text settings ----------------------
\NewDocumentCommand\circled { m } {
	\raisebox{.5pt}{
		\textcircled{\raisebox{-.9pt}{#1}}
	}
} % define a new command for circled text since \textcircled is very sloppy

% --------------------------- endnotes settings ----------------------
\RenewDocumentCommand\thefootnote{}{\protect\circled{\arabic{footnote}}}

\NewDocumentCommand\somewords{}{
	ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxuy 
	\par
	中文字体
	\par
}

\NewDocumentCommand\showfont{}{
	{
		\begin{center}
			\textbf{字体展示}
		\end{center}
			\par
			\( \hbar ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxuy \)
			\par
			% $ \symbf{\hbar ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxuy} $
			
			\somewords
			
			{\bfseries \somewords}
			
			\itshape \somewords
			
			\sffamily \somewords
			
			\bfseries \somewords
			% \newpage
			
			\itshape \somewords
			
			\ttfamily \somewords
			
			\bfseries \somewords
			
			\itshape \somewords
	}
}

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

\DeclareDocumentCommand\maketitle{}{
	\frontmatter
	\pagestyle{empty}
	\begin{center}
		\vspace{4ex}
		\includegraphics[width=8cm]{xmu-flag}\par
		\vspace{4ex}

{
	\rmfamily\zihao{-2}\l__xmu_degree_tl \quad 毕\quad 业\quad 论\quad 文\quad （~设\quad 计~)\par\vspace{2ex}
}

{
	\rmfamily\zihao{3}（\l__xmu_majorordouble_tl)\par \vspace{3ex}
} 

{
	\sffamily\zihao{2}\l__xmu_title_tl \par\vspace{3ex}
}

{ 
	\rmfamily\bfseries\zihao{3} \l__xmu_englishtitle_tl\par\vspace{5ex}
}
	

	{ \rmfamily \zihao{4}
		\begin{tabular}{rl} 
			姓\qquad 名： & \l__xmu_author_tl        \\
			学\qquad 号： & \l__xmu_studentnumber_tl \\
			学\qquad 院： & \l__xmu_department_tl    \\
			专\qquad 业： & \l__xmu_major_tl         \\
			年\qquad 级： & \l__xmu_class_tl         \\
			校内指导教师： & \l__xmu_advisor_tl        \\
			校外指导教师： & \l__xmu_otheradvisor_tl   \\
		\end{tabular}%
	}
	\vspace{2ex}
	\rmfamily\zihao{4}%\mdseries
	\par\vspace{7ex}
	\l__xmu_date_tl
	\vspace{2ex}
\end{center}
\chapter*{厦门大学本科学位论文诚信承诺书}
\setcounter{page}{1}

{\fontsize{14pt}{28pt}\selectfont
	
	本人呈交的学位论文是在导师指导下独立完成的研究成果。本人在论文写作中参考其他个人或集体已经发表的研究成果，均在文中以适当方式明确标明，并符合相关法律规范及《厦门大学本科毕业论文（设计）规范》。
	\par
	该学位论文为（\l__xmu_team_tl%
	）课题（组）的研究成果，获得
	（%
	\l__xmu_fundteam_tl）课题（组）经费或实验室的资助，
	在（%
	\l__xmu_lab_tl）实验室完成。（请在以上括号内填写课题或课题组负责人或
	实验室名称，未有此项声明内容的，可以不作特别声明。）
	\par	
	另外，本人承诺辅修专业毕业论文（设计）（如有）的内容与主修专业不存在相同与相近情况。
	\par
	\vspace{30pt}
	
	\hfill 学生声明（签名）：\hspace*{4cm}
	\par\vspace{2ex}
	\hfill 年\hspace{26pt}月\hspace{26pt}日\hspace*{2cm}
}
}

\makeatother





% --------------------------- reference settings ------------------------
% required packages:
% - cleveref
% \crefname params: 
% first: type
% second: singular cross reference
% third: plural cross reference
\RenewDocumentCommand\citep{m}{{\color{blue}\citeauthor{#1}(\citeyearpar{#1})}}
\crefformat{figure}{#2图~#1#3}
\crefrangeformat{figure}{图~(#3#1#4)\;$\sim$\;(#5#2#6)}
\crefmultiformat{figure}{图~(#2#1#3)}{和~(#2#1#3)}{，(#2#1#3)}{和~(#2#1#3)}

\crefformat{table}{#2表#1#3}
\crefrangeformat{table}{表(#3#1#4)\;$\sim$\;(#5#2#6)}
\crefmultiformat{table}{表~(#2#1#3)}{和~(#2#1#3)}{，(#2#1#3)}{和~(#2#1#3)}

\crefformat{equation}{~(#2#1#3)}
\crefrangeformat{equation}{~(#3#1#4)\;$\sim$\;(#5#2#6)}
\crefmultiformat{equation}{~(#2#1#3)}{ 和~(#2#1#3)}{，(#2#1#3)}{ 和~(#2#1#3)}
% equation, chapter, section, etc.
% \creflabelformat{htypei}{hformati}

% --------------------------- equations&principles settings ------------------------
% required packages:
% - amsthm
\newtheorem{theory}{定理}[section]
\newtheorem{law}{定律}[section]
\theoremstyle{definition}


%%============================关键词===========================%%

%%关键词。

\NewDocumentCommand\keywords { s m } {
	\vspace{2ex}\noindent{\sffamily \bfseries 
	\IfBooleanTF {#1} {
		关键词：
	}{
		Keywords:~
	}
	} #2
}


\tl_new:N \l__xmu_author_tl
\tl_new:N \l__xmu_title_tl
\tl_new:N \l__xmu_date_tl
\tl_new:N \l__xmu_class_tl
\tl_new:N \l__xmu_studentnumber_tl
\tl_new:N \l__xmu_department_tl
\tl_new:N \l__xmu_major_tl
\tl_new:N \l__xmu_advisor_tl
\tl_new:N \l__xmu_otheradvisor_tl
\tl_new:N \l__xmu_team_tl
\tl_new:N \l__xmu_fundteam_tl
\tl_new:N \l__xmu_degree_tl
\tl_new:N \l__xmu_englishtitle_tl
\tl_new:N \l__xmu_majorordouble_tl
\tl_new:N \l__xmu_lab_tl

\keys_define:nn { xmu }{
	author        .tl_set:N  = \l__xmu_author_tl        ,
	title         .tl_set:N  = \l__xmu_title_tl         ,
	date          .tl_set:N  = \l__xmu_date_tl          ,
	class         .tl_set:N  = \l__xmu_class_tl         ,
	studentnumber .tl_set:N  = \l__xmu_studentnumber_tl ,
	department    .tl_set:N  = \l__xmu_department_tl    ,
	major         .tl_set:N  = \l__xmu_major_tl         ,
	advisor       .tl_set:N  = \l__xmu_advisor_tl       ,
	otheradvisor  .tl_set:N  = \l__xmu_otheradvisor_tl  ,
	team          .tl_set:N  = \l__xmu_team_tl          ,
	fundteam      .tl_set:N  = \l__xmu_fundteam_tl      ,
	degree        .tl_set:N  = \l__xmu_degree_tl        ,
	englishtitle  .tl_set:N  = \l__xmu_englishtitle_tl  ,
	majorordouble .tl_set:N  = \l__xmu_majorordouble_tl ,
	lab           .tl_set:N  = \l__xmu_lab_tl           ,
}

\NewDocumentCommand \XMUsetup { m }{
\keys_set:nn { xmu } { #1 }}