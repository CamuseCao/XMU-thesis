![](https://img.shields.io/badge/Language-TeX-red.svg) ![](https://img.shields.io/github/stars/CamuseCao/XMU-Undergraduate-thesis-template.svg?style=social) ![](https://img.shields.io/github/release/CamuseCao/XMU-Undergraduate-thesis-template.svg?label=version)  ![](https://img.shields.io/github/last-commit/CamuseCao/XMU-Undergraduate-thesis-template.svg?style=social&logo=Tinder) ![](https://img.shields.io/github/repo-size/CamuseCao/XMU-Undergraduate-thesis-template.svg) ![](https://img.shields.io/github/languages/code-size/CamuseCao/XMU-Undergraduate-thesis-template.svg) ![](https://img.shields.io/github/followers/CamuseCao.svg?label=Followers) ![](https://img.shields.io/github/downloads/CamuseCao/XMU-Undergraduate-thesis-template/v0.11/total.svg?style=plastic) 



![]()


# 厦门大学模板使用说明

[TOC]


## 使用的前提

为了使用该模板，需要安装一个`TeX`的发行版本。可以选择`Texlive`或者`Miktex`,他们都是跨平台的。而`Texlive`打包了比较多的宏包，较为庞大，`Miktex`则是临时下载没有的宏包。这里我推荐使用`Miktex`。但是对于Mac，推荐使用`MacTeX`，它是为Mac定制的发行版本，应该比较合适。特别提醒`CTeX`套装无法运行该模板。你可以选择卸载`CTeX`套装，安装我推荐的发行版本，或者不使用该模板。关于编译方式需选择`XeLaTeX`,否则无法正常编译该模板,如果熟悉`latexmk`的可以用它来编译，这更好。

如果你不想在本地安装`TeX`的发行版本，其实可以使用 [Overleaf](https://www.overleaf.com) 在线编译平台，同样请使用`XeLaTeX`编译。如果想在线编译请选择我的另外一个项目去编译。我会在最后附上地址。能在Overleaf编译多亏了他们支持人员 LianTze Lim 的帮助，在此表示感谢。 大家如果在这个平台上使用遇到什么技术问题可以发邮件向[支持人员](mailto:support@overleaf.com)请教，很可能回复的是林前辈哦，请大家不要发邮件问怎么样才能访问该网站。~~关于打开该网址的正确姿势是找到一个靠谱的梯子，然后爬上去。~~

## 模板使用说明

为了正确使用该模板，请按照提示安装好可使用的TeX发行版本。因为论文内容比较多，因此采取了分文件的方式来构成该文档。主文档`XMU.tex`的位置位于`Main`下，正确编译后所得的pdf文件就在这里。`Figure`文件夹是存放图片的文件夹，该文件夹已经加入图片文件夹的位置，插入图片是无需多加路径，直接用文件名即可。关于`Setting`文件夹只需要把里面的`Information.tex`正确填入即可。而你需要编辑的仅有`Body`文件夹下的文件。

当你需要毕业论文的打印时。可以打开`Cover and reconsitution`文件夹，封面的制作程序已经做好了，使用它应该能的到你想要的`a3`封面，你可以自己再做调整。关于整篇论文的打印，可以在运行主文档`Main/XMU.tex`时选择用用`openright`选项，如果它生成的pdf仍然不满意，可以用`Reconsitution.tex`自己拼接和加空白页，这样总能完成工作。



你可以使用`make1.bat`和`make2.bat`来直接编译得到所有的结果。

## 几点说明

- 该模板应该能够在`Mac`和`Windows`系统下运行。`windows`用户无需更改配置，但是`Mac`用户请打开`Settings/Seetting.tex`文件下，搜索`Windows`,按找到位置处注释的提示操作，即可运行。~~最近事情多，没用虚拟机去测试Linux。有同学测试了可以和我反应一下结果啊。~~

- 该模板是在厦门大学博士学位论文模板的基础上修改得到的，因为本科论文与博士学位论文的要求差别比较的，所以定制了该模板。

-  在使用该模板之前，请把原始编译出来的文档读一下，对于你的使用是很有帮助的。

- 由于本人水平有限，因此该模板写的并不好，但是应该勉强能够满足毕业论文的要求。但是仍然可能有许多错误的地方，希望各位使用者如果能发现错误之处能够提出。可以给我法邮件或者直接在 `github`上面提`issue`。欢迎大家的参与，共同完善母校的模板。

- 由于本人是一名理科生，对文科的同学毕业论文的额外需求可能了解不多。虽说文科生用这个模板的可能性比较小，如果有人用，有额外的需求也可以提出。

## 联系方式

邮箱： [camusecao@gmail.com](mailto:camusecao@gmail.com)

该项目github项目的地址是 : [Link](https://github.com/CamuseCao/XMU-Undergraduate-thesis-template)

`Overleaf`在线编译的项目的地址 ：[Github下载](https://github.com/CamuseCao/XMU-Thesis-Overleaf)    [Overleaf查看与下载](https://www.overleaf.com/2128697983jhmpkzxdzmry) 

(`Overleaf`项目的地址请勿随意编辑，方便大家的观看。你可以把它拷到你自己的项目下尽情玩耍。 )
