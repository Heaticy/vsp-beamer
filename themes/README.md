# Themes

可用主题：

- `tutorial-red`
- `tutorial-red-shtu`
- `tutorial-purple`
- `tutorial-nailong`
- `report-red`
- `report-nailong`
- `tutorial-showcase`：上海科技大学炫技版，上科大红 `#A40006` 配金色；封面、章节页、尾页使用深红渐变、校徽、校名、校训与校园剪影，正文页带校徽与进度页脚，并提供 `\VSPstat`、`\VSPmark`、`\VSPchip`、`\VSPsteps`、`\VSPmeter` 组件
- `tutorial-showcase-sakura`：炫技版版式，樱花粉 `#C2566A` 配月白蓝 `#4F78A8`，封面为蓝到粉渐变
- `tutorial-showcase-coral`：炫技版版式，珊瑚红 `#DB2F23` 配扶光色 `#C9764A`／`#F7BD98`，封面为深红到珊瑚红渐变
- `tech-dark`：电路风格，取自 SI100B 课程幻灯片；近黑蓝底，标题栏带 PCB 走线与校徽，蓝紫渐变细线，衬线标题，圆角卡片式提示框，提供 `\VSPstat` 数字卡片与 `VSPcard` 图片卡片
- `tech-light`：电路风格浅色版，浅灰底，版式与组件同 `tech-dark`

共享实现位于 `beamerthemeVSP.sty`。在文稿中使用：

```tex
\usetheme{tutorial-red}
\VSPsetspeaker{Presenter Name}{School or team}
```

仓库 Makefile 会自动设置 `TEXINPUTS`。`\VSPsetspeaker[Speaker]{姓名}{详情}` 为所有主题提供统一的封面演讲者组件，并同步 Beamer 的 `\author`/`\institute`；旧写法仍兼容。`\VSPsetupfootline{课程与节次}{年份}{主讲者}` 设置页尾三格信息栏，无背景图的主题变体逐页展示并在尾页底部同步展示，shtu变体因背景图占据页底而仅在尾页底部展示。在其他工程使用时，推荐先安装用户级运行时包：

```bash
make install
# 任意目录中的文稿均可直接使用 \usetheme{tutorial-red}
```

也可以手工保持当前目录结构使用仓库源码。安装包会提供共享主题、十一个主题入口、背景、Logo、电路插画和 Nailong 图片；不会安装模板、practice、Agent Skill 或系统字体。Noto CJK SC 是前置依赖（Debian/Ubuntu：`fonts-noto-cjk`）。已安装运行时通过 `vsp-beamer update` 升级，仓库 checkout 通过 `make upgrade` 升级。
