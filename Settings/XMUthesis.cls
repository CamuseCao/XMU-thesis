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
\bool_set_false:N \l__xmu_overleaf_font_bool
\bool_set_false:N \l__xmu_undergraduate_bool
\bool_set_false:N \l__xmu_master_bool
\bool_set_false:N \l__xmu_doctor_bool

\bool_set_true:N \l__xmu_toc_toc_bool
\bool_set_true:N \l__xmu_toc_abs_bool
\bool_set_true:N \l__xmu_toc_ref_bool

\keys_define:nn { XMUthesis }{
	degree                 .choice:                   ,
	degree                 .default:n = undergraduate ,
	degree / undergraduate .code:n = \bool_set_true:N \l__xmu_undergraduate_bool ,
    degree / master        .code:n = \bool_set_true:N \l__xmu_master_bool        ,
	degree / doctor        .code:n = \bool_set_true:N \l__xmu_doctor_bool        ,

	nottoc .code:n = \bool_set_false:N \l__xmu_toc_toc_bool ,
	notabs .code:n = \bool_set_false:N \l__xmu_toc_abs_bool ,
	notbib .code:n = \bool_set_false:N \l__xmu_toc_ref_bool ,

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
			\msg_warning:nn { ubuntu font } { msg } ,
	font / overleaf .code:n    = \PassOptionsToClass{fontset =none}{ctexbook}
		\bool_set_true:N \l__xmu_overleaf_font_bool ,
	font / advance  .code:n    = \PassOptionsToClass{fontset =none}{ctexbook}
		\bool_set_true:N \l__xmu_advanced_font_bool ,
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

\NewDocumentCommand\degree{ m m m }{
    \IfBooleanTF{\l__xmu_undergraduate_bool}{
        #1
    }{
        \IfBooleanTF{\l__xmu_master_bool}{
            #2
        }{
            #3
        }
    }
}

\NewDocumentCommand\undergratuateTF{ m m }{
    \IfBooleanTF{\l__xmu_undergraduate_bool}{
		#1
	}{
		#2
	}
}

\undergratuateTF{

}{
	\RequirePackage{xeCJKfntef}
}
\RequirePackage[UseMSWordMultipleLineSpacing,MSWordLineSpacingMultiple=1.5]{zhlineskip}

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
	etoolbox       ,
	% tocbibind      ,
    xcolor         ,
    listings       ,
	gbt7714		   ,
    % float          ,
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
\bool_if:NTF \l__xmu_undergraduate_bool{
	\captionsetup{font={small,bf}}
}{
	\captionsetup{font={normalsize,bf}}
}

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

\bool_if:NT \l__xmu_overleaf_font_bool{
	% \setmainfont{Noto~Serif}
	% \setsansfont{Noto~Sans}
	% \setmonofont{Noto~Mono}
	\setCJKmainfont{Noto~Serif~CJK~SC}
	\setCJKsansfont{Noto~Sans~CJK~SC}
	\setCJKmonofont{Noto~Sans~Mono~CJK~SC}
	% \setmathfont{XITSMath}
}


\RenewDocumentCommand\chaptermark{m}{\markboth{#1}{#1}}

\fancyhf{}  % cleans original header&footer
\fancyhead[CE]{\zihao{-5} \l__xmu_title_tl}
\fancyhead[CO]{\zihao{-5} \leftmark}  %\leftmark \chaptermark
\fancyfoot[C]{\thepage}

\RenewDocumentCommand\headrulewidth{}{0pt}


\ctexset{
	today          =	big,  % format date
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
		format     = 	\zihao{4}\sffamily,
						},
}


\newlistof{indice}{tce}{Table~of~Contents}

\setlength{\cftbeforetcetitleskip}{-30pt}
\setlength{\cftbeforechapskip}{8pt}
\setlength{\cftbeforesecskip}{6pt}
\setlength{\cftbeforesubsecskip}{4pt}
\setlength{\cftbeforetoctitleskip}{-30pt}
\setlength{\cftsecnumwidth}{3.2em}
\setlength{\cftsubsecindent}{4.5em}
\RenewDocumentCommand\cftchapleader{}{\cftdotfill{\cftdotsep}} % for chapters
% Add \thispagestyle{plain} to the font setting to force the pagestyle in toc always be plain, or it maybe influence by my slfe-define \cleanrdoublepage 
\bool_if:NTF \l__xmu_undergraduate_bool{
	\RenewDocumentCommand\cftchapfont{}{\thispagestyle{plain}\zihao{4}\sffamily}% Chapter font
	\RenewDocumentCommand\cftsecfont{}{\thispagestyle{plain}\zihao{-3}\sffamily}% Section font 
	\RenewDocumentCommand\cftsubsecfont{}{\thispagestyle{plain}\zihao{-3}\rmfamily}%subsection font
}{
	\RenewDocumentCommand\cftchapfont{}{\thispagestyle{plain}\zihao{4}\sffamily\bfseries}% Chapter font
	\RenewDocumentCommand\cftsecfont{}{\thispagestyle{plain}\zihao{-4}\sffamily\bfseries}% Section font 
	\RenewDocumentCommand\cftsubsecfont{}{\thispagestyle{plain}\zihao{-4}\rmfamily}%subsection font
}

% \RenewDocumentCommand\cfttoctitlefont{}{\hfill\zihao{-3}\sffamily  目\quad 录\hfill}%\phantom{mmmmmmmmm}
% \RenewDocumentCommand\cftaftertoctitle{}{\hfill}
\RenewDocumentCommand\cfttoctitlefont{}{\hspace*{\fill}\zihao{-3}\sffamily}
\RenewDocumentCommand\cftaftertoctitle{}{\hspace*{\fill}}
% \RenewDocumentCommand\cfttcetitlefont{}{\hfill\zihao{-3}\rmfamily\bfseries Table~of~Contents\hfill}%\phantom{mmmmmmm}
% \RenewDocumentCommand\cftaftertcetitle{}{\hfill}
\RenewDocumentCommand\cfttcetitlefont{}{\hspace*{\fill}\zihao{-3}\rmfamily\bfseries}
\RenewDocumentCommand\cftaftertcetitle{}{\hspace*{\fill}}

\let\oldappendix\appendix
\bool_set_false:N \l__xmu_appendix_bool
\RenewDocumentCommand\appendix{}{
	\oldappendix
	\bool_set_true:N \l__xmu_appendix_bool
}

\makeatletter
\NewDocumentCommand\captce { m } {
	\if@mainmatter
	\bool_if:NTF \l__xmu_appendix_bool{
		\addcontentsline{tce}{chapter}{
			\rmfamily\bfseries \protect\makebox[5em][l]{Appendix~\thechapter}~\;\;#1}
	}{
		\addcontentsline{tce}{chapter}{
			\rmfamily\bfseries \protect\makebox[5em][l]{Chapter~\thechapter}#1}
	}
    \else
		\addcontentsline{tce}{chapter}{
		\rmfamily\bfseries\protect\makebox[0em][l]{}#1}
\fi 
}
\makeatother

\NewDocumentCommand\sectce { m } {
	\addcontentsline{tce}{section}{
		\rmfamily\bfseries\protect\makebox[2.3em][l]{\thesection}#1
	}
}

\NewDocumentCommand\ssectce { m } {
	\addcontentsline{tce}{subsection}{
		\protect\makebox[2.3em][l]{\thesubsection}#1
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

\let\oldcleardoublepage\cleardoublepage
\NewDocumentCommand\clearemptydoublepage{}{
	\clearpage % don't delete it, even it's follewed by \cleardoublepage
	% {\pagestyle{empty}\origdoublepage}
	\thispagestyle{empty}\oldcleardoublepage
}

\let\cleardoublepage\clearemptydoublepage


\NewDocumentCommand\xmutableofcontents{}{
	\cleardoublepage
	\bool_if:NTF \l__xmu_toc_toc_bool{
		\addcontentsline{toc}{chapter}{\protect 目录}\captce{目录}
		\tableofcontents
		% \pagestyle{plain}
		\cleardoublepage
		\addcontentsline{toc}{chapter}{\protect Table~of~Contents}\captce{Table~of~Contents}
		\listofindice
		% \pagestyle{plain}
	}{
		\tableofcontents
		% \pagestyle{plain}
		\cleardoublepage
		\listofindice
		% \pagestyle{plain}
	}
	\cleardoublepage
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
\makeatother

\DeclareDocumentCommand\maketitle{}{
\frontmatter
\pagestyle{empty}
	\bool_if:NTF \l__xmu_undergraduate_bool{
		\input{Settings/Contents/undergraduate-titlepage.tex}
		\input{Settings/Contents/undergraduate-commitment.tex}
	}{
		\input{Settings/Contents/master-or-doctor-titlepage.tex}
		\input{Settings/Contents/Certification-statement.tex}
		\input{Settings/Contents/Copyright-declaration.tex}
	}
\cleardoublepage
}

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

\bool_if:NT \l__xmu_toc_ref_bool{
	% \AfterEndEnvironment{thebibliography}{
	\AtBeginEnvironment{thebibliography}{
		\cleardoublepage % with \cleardoublepage will get the right page number
		\addcontentsline{toc}{chapter}{\protect 参考文献}
		% \captce{Reference}
		\addcontentsline{tce}{chapter}{
		\rmfamily\bfseries\protect\makebox[0em][l]{}Reference}
	}
}
% --------------------------- equations&principles settings ------------------------
% required packages:
% - amsthm
\newtheorem{theory}{定理}[section]
\newtheorem{law}{定律}[section]
\theoremstyle{definition}


\NewDocumentEnvironment {abstract} { s }{
    \bool_if:NTF \l__xmu_toc_abs_bool{
        \IfBooleanTF {#1}{
			\chapter*{摘要}
			\addcontentsline{toc}{chapter}{\protect 摘要}
			\captce{\bfseries 摘要}
			}{
				\chapter*{\bfseries Abstract}
				\addcontentsline{toc}{chapter}{\protect Abstract}
				\captce{\bfseries Abstract}
		}
    }{
        \IfBooleanTF {#1}{
            \chapter*{摘要}
            }{
                \chapter*{\bfseries Abstract}
        }
    }
}{
}

%%============================关键词===========================%%

%%关键词。

\NewDocumentCommand\keywords { s m } {
	\par\vspace{2ex}\noindent{\sffamily \bfseries 
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
\tl_new:N \l__xmu_classified_code_tl
\tl_new:N \l__xmu_security_classification_tl
\tl_new:N \l__xmu_UDC_tl
\tl_new:N \l__xmu_submit_date_tl
\tl_new:N \l__xmu_defense_date_tl
\tl_new:N \l__xmu_conferred_date_tl
\tl_new:N \l__xmu_chairman_tl
\tl_new:N \l__xmu_referee_tl

\keys_define:nn { xmu }{
	author                  .tl_set:N  = \l__xmu_author_tl                  ,
	title                   .tl_set:N  = \l__xmu_title_tl                   ,
	date                    .tl_set:N  = \l__xmu_date_tl                    ,
	class                   .tl_set:N  = \l__xmu_class_tl                   ,
	studentnumber           .tl_set:N  = \l__xmu_studentnumber_tl           ,
	department              .tl_set:N  = \l__xmu_department_tl              ,
	major                   .tl_set:N  = \l__xmu_major_tl                   ,
	advisor                 .tl_set:N  = \l__xmu_advisor_tl                 ,
	otheradvisor            .tl_set:N  = \l__xmu_otheradvisor_tl            ,
	team                    .tl_set:N  = \l__xmu_team_tl                    ,
	fundteam                .tl_set:N  = \l__xmu_fundteam_tl                ,
	degree                  .tl_set:N  = \l__xmu_degree_tl                  ,
	englishtitle            .tl_set:N  = \l__xmu_englishtitle_tl            ,
	majorordouble           .tl_set:N  = \l__xmu_majorordouble_tl           ,
	lab                     .tl_set:N  = \l__xmu_lab_tl                     ,
	classified_code         .tl_set:N  = \l__xmu_classified_code_tl         ,
	security_classification .tl_set:N  = \l__xmu_security_classification_tl ,
	UDC                     .tl_set:N  = \l__xmu_UDC_tl                     ,
	submit_date             .tl_set:N  = \l__xmu_submit_date_tl             ,
	defense_date            .tl_set:N  = \l__xmu_defense_date_tl            ,
	conferred_date          .tl_set:N  = \l__xmu_conferred_date_tl          ,
	chairman                .tl_set:N  = \l__xmu_chairman_tl                ,
	referee                 .tl_set:N  = \l__xmu_referee_tl                 ,
}

\NewDocumentCommand \XMUsetup { m }{
\keys_set:nn { xmu } { #1 }}
