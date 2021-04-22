%%
%% This is file `xmuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% xmuthesis.dtx  (with options: `class')
%% <!--
%% ----------------------------------------------------------------
%% xmuthesis --- A LaTeX template for XMU thesis writing
%% E-mail: camusecao@gmail.com
%% Released under the LaTeX Project Public License v1.3c or later
%% See http://www.latex-project.org/lppl.txt
%% ----------------------------------------------------------------
%% -->
%% File: xmuthesis.dtx
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
        \msg_new:nnn { engine } { msg } {
            Don't~use~pdfLaTeX~to~compile~the~final~TeX~files.
        }
        \msg_warning:nn { engine } { msg }
}

\ProvidesClass{ xmuthesis }[2020/10/04 v0.4.1 XMU thesis]

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

\keys_define:nn { xmuthesis }{
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
    bibstyle / numbers        .code:n =
        \AfterPackage{gbt7714}{\citestyle{numbers}}                     ,
    bibstyle / authoryear     .code:n =
        \AfterPackage{gbt7714}{\bibliographystyle{gbt7714-author-year}} ,
    bibstyle / unknown        .code:n =
    \msg_error:nnxxx { xmuthesis } { unknown-choice } { bibstyle }
                     { numerical, numbers, authoryear }
                     { The~choice~' #1 '~is~invalid~for~bibstyle} ,

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
    font / unknown  .code:n = \msg_error:nnxxx { xmuthesis } { unknown-choice }{ font }{
        empty, adobe, fandol, founder, mac, macnew, macold, ubuntu, windows, advance
        }{
            The~choice~' #1 '~is~invalid~for~font
    },
}

\ProcessKeysOptions { xmuthesis }

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
\RequirePackage[UseMSWordMultipleLineSpacing,MSWordLineSpacingMultiple=1.5]
{zhlineskip}

\RequirePackage{
    amsthm         ,
    physics        ,
    siunitx        ,
    verbatim       ,
    multirow       ,
    geometry       ,
    fancyhdr       ,
    graphicx       ,
    % longtable      ,
    booktabs       ,
    tabularx       ,
    caption        ,
    threeparttable ,
    subfig         ,
    tocloft        ,
    % tocbibind      ,
    xcolor         ,
    listings       ,
    gbt7714        ,
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
        Extension           = .otf          ,
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
    today          =    big,  % format date
    chapter        =     {
    format         =     \centering\zihao{-3}\sffamily,
    beforeskip     =     -15pt,
    afterskip      =     30pt,
    pagestyle      =      fancy,},%
    section        =     {
        format     =     \zihao{4}\sffamily,
        beforeskip =     10pt,
        afterskip  =     10pt,
                        },
    subsection        =     {
        format     =     \zihao{4}\sffamily,
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
\bool_if:NTF \l__xmu_undergraduate_bool{
    \RenewDocumentCommand\cftchapfont{}{
        %\thispagestyle{plain}
        \zihao{4}\sffamily
    }% Chapter font
    \RenewDocumentCommand\cftsecfont{}{
        %\thispagestyle{plain}
        \zihao{-3}\sffamily
    }% Section font
    \RenewDocumentCommand\cftsubsecfont{}{
        %\thispagestyle{plain}
        \zihao{-3}\rmfamily
    }%subsection font
}{
    \RenewDocumentCommand\cftchapfont{}{
        \thispagestyle{plain}\zihao{4}\sffamily\bfseries
    }% Chapter font
    \RenewDocumentCommand\cftsecfont{}{
        \thispagestyle{plain}\zihao{-4}\sffamily\bfseries
    }% Section font
    \RenewDocumentCommand\cftsubsecfont{}{
        \thispagestyle{plain}\zihao{-4}\rmfamily
    }%subsection font
}

\RenewDocumentCommand\cfttoctitlefont{}{\hspace*{\fill}\zihao{-3}\sffamily}
\RenewDocumentCommand\cftaftertoctitle{}{\hspace*{\fill}}
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
        \addcontentsline{toc}{chapter}{\protect Table~of~Contents}
        \captce{Table~of~Contents}
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
    \pagestyle{fancy}
}

\makeatother

\graphicspath{{figs}{Figures/}{../Figures/}} %设定图片的存放路径

\NewDocumentCommand\circled { m } {
    \raisebox{.5pt}{
        \textcircled{\raisebox{-.9pt}{#1}}
    }
} % define a new command for circled text since \textcircled is very sloppy

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

\makeatletter
\def\algbackskip{\hskip-\ALG@thistlm}
\makeatother

\DeclareDocumentCommand\maketitle{}{
\frontmatter
\pagestyle{empty}
    \bool_if:NTF \l__xmu_undergraduate_bool{
\begin{center}
    \IfFileExists{figs/xmu-flag.pdf}{
        \includegraphics[width=8cm]{xmu-flag}
        }{\xmulogo[0.32]}
    \par
    \vspace{1ex}

    {
    \rmfamily\zihao{-2}\l__xmu_degree_tl
    \quad 毕\quad 业\quad 论\quad 文\quad
    （~设\quad 计~）\par\vspace{1ex}
    }

    {
    \rmfamily\zihao{3}（\l__xmu_majorordouble_tl）\par
    }

    {
    \sffamily\zihao{2}\l__xmu_title_tl \par\vspace{1ex}
    }

    {
    \rmfamily\bfseries\zihao{3} \l__xmu_englishtitle_tl\par\vspace{3ex}
    }

    { \rmfamily \zihao{4}
        \begin{tabular}{rl}
                姓 \qquad 名：& \l__xmu_author_tl        \\
                学 \qquad 号：& \l__xmu_studentnumber_tl \\
                学 \qquad 院：& \l__xmu_department_tl    \\
                专 \qquad 业：& \l__xmu_major_tl         \\
                年 \qquad 级：& \l__xmu_class_tl         \\
                校内指导教师：& \l__xmu_advisor_tl       \\
                校外指导教师：& \l__xmu_otheradvisor_tl  \\
        \end{tabular}%
    }
    \vspace{2ex}
    \rmfamily\zihao{4}
    \par\vspace{4ex}
    \l__xmu_date_tl
    \vspace{2ex}
\end{center}

\chapter*{厦门大学本科学位论文诚信承诺书}
\setcounter{page}{1}

{\fontsize{14pt}{21pt}\selectfont

    本人呈交的学位论文是在导师指导下独立完成的研究成果。
    本人在论文写作中参考其他个人或集体已经发表的研究成果，均在文中以适当方式明确标明，
    并符合相关法律规范及《厦门大学本科毕业论文（设计）规范》。
    \par
    该学位论文为（\l__xmu_team_tl）课题（组）的研究成果，
    获得（\l__xmu_fundteam_tl）课题（组）经费或实验室的资助，
    在（\l__xmu_lab_tl）实验室完成。
    （请在以上括号内填写课题或课题组负责人或
    实验室名称，未有此项声明内容的，可以不作特别声明。）
    \par
    另外，本人承诺辅修专业毕业论文（设计）
    （如有）的内容与主修专业不存在相同与相近情况。
    \par
    \vspace{30pt}

    \hfill 学生声明（签名）：\hspace*{4cm}
    \par\vspace{2ex}
    \hfill 年\hspace{26pt}月\hspace{26pt}日\hspace*{2cm}
}

    }{
\begin{center}
    {
        \vspace*{-5ex}
        % \raggedright
        \rmfamily\bfseries\zihao{-4}
        学校编码：10384\hfill 分类号\CJKunderline{\l__xmu_classified_code_tl}
        \quad 密级 \CJKunderline{\l__xmu_security_classification_tl}\par
        学号：\l__xmu_studentnumber_tl\hfill UDC\;
        \CJKunderline{\l__xmu_UDC_tl}\par\vspace{6ex}
        \centering\IfFileExists{figs/xmu-flag.pdf}{
            \includegraphics[width=5cm]{xmu-flag}
            }{\xmulogon[0.65]}\par\vspace{4ex}
    }
    {
        \rmfamily\bfseries\zihao{-2}
        \bool_if:NTF \l__xmu_master_bool{
            硕\quad 士\quad 学\quad 位\quad 论\quad 文
            }{
            博\quad 士\quad 学\quad 位\quad 论\quad 文
        }
        \par\vspace{2ex}
    }
    {
        \sffamily\bfseries\zihao{2}\l__xmu_title_tl\par\vspace{2ex}
    }
    {
        \rmfamily\bfseries\zihao{3}\l__xmu_englishtitle_tl\par\vspace{2ex}
    }
    {
        \ttfamily\zihao{-2}\l__xmu_author_tl\par\vspace{2ex}
    }
    {
        \ttfamily\zihao{4}
        \begin{tabular}{rl}
            指导教师姓名：& \l__xmu_advisor_tl       \\
            专\hspace{0.66\ccwd} 业\hspace{0.66\ccwd} 名\hspace{0.66\ccwd} 称：
                               & \l__xmu_major_tl    \\
            论文提交日期：& \l__xmu_submit_date_tl   \\
            论文答辩时间：& \l__xmu_defense_date_tl  \\
            学位授予日期：& \l__xmu_conferred_date_tl\\
        \end{tabular}%
        \par\vspace{1cm}
    }
    {
        \zihao{4}
        答辩委员会主席：\l__xmu_chairman_tl\par
        评阅人：\l__xmu_referee_tl\par
        \l__xmu_date_tl\par
    }
\end{center}

\chapter*{厦门大学学位论文原创性声明}
\setcounter{page}{1}
{
\zihao{4}
本人呈交的学位论文是本人在导师指导下,独立完成的研究成果。
本人在论文写作中参考其他个人或集体已经发表的研究成果，
均在文中以适当方式明确标明，并符合法律规范和《厦门大学研究生学术活动规范（试行）》。
\par

另外，该学位论文为（\l__xmu_team_tl）课题（组）的研究成果，
获得（\l__xmu_fundteam_tl）课题（组）经费或实验室的资助，
在（\l__xmu_lab_tl）实验室完成。
（请在以上括号内填写课题或课题组负责人或实验室名称，
未有此项声明内容的，可以不作特别声明。）
\par

本人声明该学位论文不存在剽窃、抄袭等学术不端行为，
并愿意承担因学术不端行为所带来的一切后果和法律责任。
\par

\vspace{5ex}
{
    \raggedleft
    声明人\quad  （签名）：\phantom{六个字的空白}\par
    指导教师（签名）：\phantom{六个字的空白}\par\vspace{5ex}

    年\qquad 月\qquad 日\phantom{这七个字的空白}\par
}
}
\chapter*{厦门大学学位论文著作权使用声明}{}
{
\zihao{4}
本人同意厦门大学根据《中华人民共和国学位条例暂行实施办法》
等规定保留和使用此学位论文，
并向主管部门或其指定机构送交学位论文（包括纸质版和电子版），
允许学位论文进入厦门大学图书馆及其数据库被查阅、借阅。
本人同意厦门大学将学位论文加入全国博士、硕士学位论文共建单位数据库进行检索，
将学位论文的标题和摘要汇编出版，采用影印、缩印或者其它方式合理复制学位论文。
\par

本学位论文属于：\par

（\qquad ）1.经厦门大学保密委员会审查核定的涉密学位论文，
于\qquad 年\qquad 月\qquad 日解密，解密后适用上述授权。\par

（\qquad ）2.不保密，适用上述授权。\par

（请在以上相应括号内打“√”或填上相应内容。
涉密学位论文应是已经厦门大学保密委员会审定过的学位论文，
未经厦门大学保密委员会审定的学位论文均为公开学位论文。
此声明栏不填写的，默认为公开学位论文，均适用上述授权。）\par

\vspace{12ex}
{
    \raggedleft
    声明人（签名）：\phantom{六个字的空白}\par
    年\qquad 月\qquad 日\phantom{这七个字的空白}\par
}
}
    }
\cleardoublepage
}

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

\fancypagestyle{reference}{
    \fancyhf{}
    \fancyhead[C]{参考文献}%
    \fancyfoot[C]{\thepage}
}

\bool_if:NTF \l__xmu_toc_ref_bool{
    \AddToHook{env/thebibliography/begin}{
        \cleardoublepage % with \cleardoublepage will get the right page number
        \pagestyle{reference}
        \addcontentsline{toc}{chapter}{\protect 参考文献}
        % \captce{Reference}
        \addcontentsline{tce}{chapter}{
        \rmfamily\bfseries\protect\makebox[0em][l]{}Reference}
    }
}{
    \AddToHook{env/thebibliography/begin}{
        \pagestyle{reference}
    }
}

\AddToHook{env/thebibliography/end}{
    \cleardoublepage
    \pagestyle{fancy}
}
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

\NewDocumentCommand \xmusetup { m }{
\keys_set:nn { xmu } { #1 }}

%% <!--
%% Copyright (C) 2019 by CamuseCao <https://camusecao.top>
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License (LPPL), either
%% version 1.3c of this license or (at your option) any later
%% version.  The latest version of this license is in the file:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% This work is "maintained" (as per LPPL maintenance status) by
%% CamuseCao.
%% 
%% This work consists of the file  xmuthesis.dtx
%% and the derived files           xmuthesis.cls,
%%                                 xmuthesis.pdf and
%%                                 xmulogo.sty.
%% 
%% -->
%%
%% End of file `xmuthesis.cls'.
