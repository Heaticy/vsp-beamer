# VSP-Beamer

VSP-Beamer 是一套 VSP 风格的 LaTeX Beamer 主题、模板和完整示例仓库，适合中文教学课件、论文汇报、项目介绍和正式答辩。仓库使用 `make + latexmk + XeLaTeX` 构建。

视觉体系包括红色、紫色和奶龙黄色配色，统一的章节过渡页、标题层级、青绿色分隔线、紧凑页脚、块环境、代码样式和 16:9 页面布局。

## 支持范围

VSP-Beamer 仅维护 Linux。Ubuntu/Debian 是 CI 和发布验证的参考环境；其他 Linux 发行版需要自行提供等价的 TeX Live、GNU 工具和 Noto CJK 系统字体。macOS 和 Windows 不在支持范围内。

## 环境要求

- GNU Make
- TeX Live 2022 或更新版本
- XeLaTeX、Beamer、CTeX、TikZ、`latexmk`
- 西文使用 TeX Live 自带的 Latin Modern
- 中文使用系统安装的 Noto CJK SC（Ubuntu / Debian：`fonts-noto-cjk`）

Ubuntu / Debian：

```bash
sudo apt install make latexmk texlive-xetex texlive-lang-chinese texlive-latex-extra \
  fonts-noto-cjk mupdf-tools poppler-utils imagemagick jq
```

## 快速开始

构建全部模板和 practice：

```bash
make
```

执行严格检查：

```bash
make check
```

执行完整发布检查并生成 TDS 包：

```bash
make release
# build/vsp-beamer-0.2.0.tds.tar.gz
```

编译单份文稿：

```bash
make render INPUT=templates/tutorial-red.tex OUTPUT=/tmp/tutorial-red.pdf
make render INPUT=practice/Report-4DGS/Report-4DGS.tex OUTPUT=/tmp/Report-4DGS.pdf
```

省略 `OUTPUT` 时，产物写入 `build/` 下与输入文件相同的相对路径：

```bash
make render INPUT=templates/tutorial-purple.tex
# build/templates/tutorial-purple.pdf
```

列出所有参与全量构建的文稿：

```bash
make list
```

## 用户级安装与升级

完整 Git 仓库仍是主要交付物；用户也可以把主题和运行时素材安装到自己的 `TEXMFHOME`，从仓库外编译文稿：

```bash
make install
make status
make verify-install
```

安装只写用户目录，不需要 `sudo`，也不会复制或覆盖模板、practice 或用户文稿。安装内容包括六个主题入口、共享主题、背景、Logo 和 Nailong 素材；Noto CJK 是系统前置依赖，不会重复打进 TDS 包。卸载和回滚使用：

```bash
make rollback
make uninstall
```

仓库内升级需要 Git remote，并且只接受无本地修改的 fast-forward：

```bash
make upgrade
```

已经安装到用户目录时，可以从本地 clone 升级，或在配置了 remote 的情况下从远程升级：

```bash
vsp-beamer update --from /path/to/vsp-beamer
vsp-beamer update
```

安装管理器会保留上一份运行时版本，升级前后都验证主题、字体和代表性文稿；失败时恢复旧版本。`make` 默认每天最多检查一次 Git upstream，检查失败或离线不会影响构建；关闭提示：

```bash
VSP_SKIP_UPDATE_CHECK=1 make
```

## 目录结构

```text
themes/                 Beamer 共享主题和 6 个主题入口
templates/              6 份完整、可直接编辑的标准模板
practice/               5 份完整内容型演示及其本地图片
shared-assets/          Logo、背景和示例图片
skills/vsp-beamer/      Agent Skill 入口
docs/                   开发和主题说明
build/                  PDF 构建产物，不提交
.beamer-cache/           LaTeX 中间文件，不提交
VERSION                 当前运行时 bundle 版本
scripts/                PDF 审计、更新检查和安装管理器
```

## 模板

| 文件 | 主题 | 场景 |
| --- | --- | --- |
| `templates/tutorial-red.tex` | `tutorial-red` | 通用红色教学 |
| `templates/tutorial-red-shtu.tex` | `tutorial-red-shtu` | 上海科技大学教学 |
| `templates/tutorial-purple.tex` | `tutorial-purple` | 紫色教学 |
| `templates/tutorial-nailong.tex` | `tutorial-nailong` | 奶龙黄色教学 |
| `templates/report-red.tex` | `report-red` | 默认红色报告 |
| `templates/report-nailong.tex` | `report-nailong` | 奶龙黄色报告 |

每份模板均包含封面、目录、章节页、固定标题、双栏/三栏、图片、列表、引用、代码和尾页。

## Practice

| 文件 | 内容 |
| --- | --- |
| `practice/Tutorial-CS100-r1/CS100-r1.tex` | CS100 Recitation 1 About Linux |
| `practice/Tutorial-SI100B-pj-intro/Project-00-Intro.tex` | SI100B RISC-V miniCPU Project |
| `practice/Report-4DGS/Report-4DGS.tex` | ISSCC 2026 4DGS Processor |
| `practice/Report-4DSloMo/Report-4DSloMo.tex` | 4DSloMo 与 LoRA |
| `practice/Report-MaskGaussian/Report-MaskGaussian.tex` | MaskGaussian |

所有图片已经保存在仓库中，完整 practice 可以离线编译。

## 持续集成

GitHub Actions 和 GitLab CI 都会执行 `make release`，检查版本元数据、全部 XeLaTeX 日志和 PDF 页面，并生成 TDS 发布包。无论作业成败，`build/**/*.pdf` 和 `build/*.tds.tar.gz` 中已经生成的文件都会作为 artifact 保留 14 天；本地 `build/` 和 `.beamer-cache/` 不提交。

## Agent Skill

仓库随附完整的 `vsp-beamer` Skill bundle，可处理规划、素材检查、TeX 生成或迁移、XeLaTeX 渲染、PDF 审计、主题调整、回修、恢复和最终导出。

完整流水线：

```text
plan → assets → generate → render → audit → polish → export
```

支持 `vsp-beamer:<capability>` 和短别名 `vb:<capability>`：

```text
plan  start  resume  generate  render
audit theme  assets  export    polish
```

根入口位于 `skills/vsp-beamer/SKILL.md`。每项能力也可以通过 `skills/vsp-beamer/skills/<capability>/SKILL.md` 独立执行；Skill 内含六份模板快照、五份 practice 摘要和十项能力评测集。

## 主题使用

```tex
\documentclass[aspectratio=169,10pt]{beamer}
\usepackage[UTF8,fontset=none]{ctex}
\usetheme{tutorial-red}

\title[Short title]{Presentation title}
\subtitle{Subtitle}
\VSPsetspeaker{Author}{Institute}
\date{}

\begin{document}
\VSPtitleframe

\section{Overview}
\begin{frame}{Content}
  Hello, VSP-Beamer.
\end{frame}

\VSPendframe{Questions and discussion}
\end{document}
```

主题共享实现位于 `themes/beamerthemeVSP.sty`。`\VSPsetspeaker[Speaker]{姓名}{详情}` 统一设置封面的标签、姓名和详情，同时同步标准 Beamer `\author`/`\institute` 元数据；直接使用 `\author` 和 `\institute` 仍然兼容。强调样式对齐 Marp：`\alert{...}` 渲染主题色加粗（对应 `**strong**`），`\textbf{...}` 保持标准加粗语义不变色。正文段落之间有 6pt 段间距且首行不缩进。代码排版提供 minimus 兼容接口：行内代码用 `\code{...}`（自带浅色底），代码块用 `\begin{Code}*[语言] \lstinputlisting{...} \end{Code}` 读入外部代码文件（语言为 `bash`/`c`/`cpp`/`python`/`latex`/`plain`，读文件方式不需要 `[fragile]`）。图片和表格可以用 `\begin{Figure}*[小标题]` 与 `\begin{Table}[小标题]`（含 tblr）居中排版并附灰色小标题。页尾提供三格信息栏：`\VSPsetupfootline{课程与节次}{年份}{主讲者}`，无背景图的主题变体逐页展示并在尾页底部同步展示，shtu变体因背景图占据页底而仅在尾页底部展示。通过仓库 Makefile 构建时会自动配置 `TEXINPUTS`，文稿中不需要硬编码主题绝对路径。

代码块使用 `lstlisting`（放在 `[fragile]` frame 中），主题提供统一的 `vsp` 代码样式（浅色底、主题色框线、行号），不要使用原始 `verbatim`。

## License

项目源代码和原创文档使用 [MIT License](LICENSE)。ShanghaiTech 标识、Nailong 图像和 practice 中引用的论文/课程图片不由 MIT 重新授权，具体边界见 [THIRD_PARTY_ASSETS.md](THIRD_PARTY_ASSETS.md)。
