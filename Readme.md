![](https://img.shields.io/badge/Language-TeX-red.svg) ![](https://img.shields.io/github/stars/CamuseCao/XMU-thesis.svg?style=social) ![](https://img.shields.io/github/release/CamuseCao/XMU-thesis.svg?label=version)  ![](https://img.shields.io/github/last-commit/CamuseCao/XMU-thesis.svg?style=social&logo=Tinder) ![](https://img.shields.io/github/repo-size/CamuseCao/XMU-thesis.svg) ![](https://img.shields.io/github/languages/code-size/CamuseCao/XMU-thesis.svg) ![](https://img.shields.io/github/followers/CamuseCao.svg?label=Followers) ![](https://img.shields.io/github/downloads/CamuseCao/XMU-thesis/v0.11/total.svg?style=plastic)


# 厦门大学模板使用说明

[TOC]

## 几点申明

本模板为个人开发，非学校官方模板，但是基本按照学校的要求定制的。如果在提交论文或查重遇到问题自行负责。学校每年的要求可能会改变，希望到时候学弟学妹们可以提供最新的要求文档给我。期待 2020 年会有人发给我。目前本项目还处于持续开发维护中，不用担心我会弃坑。

## 使用的前提

为了使用该模板，需要安装一个 `TeX` 的发行版本。可以选择 `Texlive` 或者 `Miktex` ,他们都是跨平台的。而 `Texlive` 打包了比较多的宏包，较为庞大， `Miktex` 则是临时下载没有的宏包。这里我推荐使用 `Miktex` 。但是对于 Mac ，推荐使用 `MacTeX` ，它是为 Mac 定制的发行版本，应该比较合适。特别提醒 `CTeX` 套装无法运行该模板。你可以选择卸载 `CTeX` 套装，安装我推荐的发行版本，或者不使用该模板。关于编译方式需选择 `XeLaTeX` ,否则无法正常编译该模板,如果熟悉 `latexmk` 的可以用它来编译，这更好。

如果你不想在本地安装 `TeX` 的发行版本，其实可以使用 [Overleaf](https://www.overleaf.com) 在线编译平台，同样请使用 `XeLaTeX` 编译。如果想在线编译请查看 [XMU-thesis](https://www.overleaf.com/read/ptthxfctspxh)。虽然现在默认的选项能编译，但是使用的是 fandol 字体，严重缺字，请保证开启 `font=overleaf` 选项让大多数简体字都能显示正常。能在 Overleaf 编译多亏了他们支持人员 LianTze Lim 的帮助，在此表示感谢。 大家如果在这个平台上使用遇到什么技术问题可以发邮件向[支持人员](mailto:support@overleaf.com)请教，很可能回复的是林前辈哦，请大家不要发邮件问怎么样才能访问该网站。~~关于打开该网址的正确姿势是找到一个靠谱的梯子，然后爬上去。~~

## 模板使用说明

为了正确使用该模板，请按照提示安装好可使用的 `TeX` 发行版本。因为论文内容比较多，因此采取了分文件的方式来构成该文档。主文件是 `XMU.tex` 。`Figure` 文件夹是存放图片的文件夹，该文件夹已经加入图片文件夹的位置，插入图片是无需多加路径，直接用文件名即可。 `Setting` 文件夹是放置模板和宏包的文件夹，使用者最好不要更改里面的东西。而你需要编辑的仅有 `Body` 文件夹下的文件。

当你需要毕业论文的打印时。可以打开 `Cover` 文件夹，封面的制作程序已经做好了，使用它应该能的到你想要的 `a3` 封面，你可以自己再做调整。

在 Windows 上你可以依次使用 `make1.bat` 和 `make2.bat` 来直接编译得到所有的结果。

另外开发了 `XMU-logo` 宏包，可以通过该宏包直接生成校徽和和学校的名字，且支持自由的改颜色。

## 几点说明

- 该模板应该能够在 `Linux` 、`Mac` 和 `Windows` 上运行，但是需要注意字体问题，为了获得较好的字体设置，记得下载对应字体并放在指定的位置，字体下载参看`fonts/ReadMe.txt`文件。

-  在使用该模板之前，请把原始编译出来的文档读一下，对于你的使用是很有帮助的。

- 由于本人水平有限，因此该模板写的并不好，但是应该勉强能够满足毕业论文的要求。需注意仍然可能有许多错误的地方，希望各位使用者如果能发现错误之处能够提出。可以给我法邮件或者直接在 `github`上面提 [issue](https://github.com/CamuseCao/XMU-thesis/issues/new) 。欢迎大家的参与，共同完善母校的模板。

- 由于本人是一名理科生，对文科的同学毕业论文的额外需求可能了解不多。虽说文科生用这个模板的可能性比较小，如果有人用，有额外的需求也可以提出。

## 联系方式

邮箱： [camusecao@gmail.com](mailto:camusecao@gmail.com)

该项目 github 项目的地址是 : [XMU-thesis](https://github.com/CamuseCao/XMU-thesis)

该项目的 Overleaf 项目地址是： [XMU-thesis](https://www.overleaf.com/read/ptthxfctspxh)