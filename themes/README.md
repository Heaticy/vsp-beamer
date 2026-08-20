# Themes

可用主题：

- `tutorial-red`
- `tutorial-red-shtu`
- `tutorial-purple`
- `tutorial-nailong`
- `report-red`
- `report-nailong`

共享实现位于 `beamerthemeVSP.sty`。在文稿中使用：

```tex
\usetheme{tutorial-red}
\VSPsetspeaker{Presenter Name}{School or team}
```

仓库 Makefile 会自动设置 `TEXINPUTS`。`\VSPsetspeaker[Speaker]{姓名}{详情}` 为所有主题提供统一的封面演讲者组件，并同步 Beamer 的 `\author`/`\institute`；旧写法仍兼容。在其他工程使用时，推荐先安装用户级运行时包：

```bash
make install
# 任意目录中的文稿均可直接使用 \usetheme{tutorial-red}
```

也可以手工保持当前目录结构使用仓库源码。安装包会提供共享主题、六个主题入口、背景、Logo 和 Nailong 图片；不会安装模板、practice、Agent Skill 或系统字体。Noto CJK SC 是前置依赖（Debian/Ubuntu：`fonts-noto-cjk`）。已安装运行时通过 `vsp-beamer update` 升级，仓库 checkout 通过 `make upgrade` 升级。
