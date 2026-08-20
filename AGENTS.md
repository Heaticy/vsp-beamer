# AGENTS.md

## 项目说明

VSP-Beamer 是 VSP 风格的 LaTeX Beamer 主题、模板和 practice 仓库。`themes/` 提供主题，`templates/` 和 `practice/` 保存最终可编辑的 TeX 文稿，`shared-assets/` 与各 practice 的 `img/` 保存离线构建素材。

## 常用命令

- 渲染单份：`make render INPUT=<input.tex> [OUTPUT=output.pdf]`
- 构建全部：`make`
- 严格检查：`make check`
- 列出文稿：`make list`
- 清理产物：`make clean`

## 工作规则

- 仅维护 Linux；Ubuntu/Debian 是 CI 和发布验证基线，不为 macOS 或 Windows 增加兼容分支。
- 使用 XeLaTeX，不要改为 pdfLaTeX；中文字体和 Unicode 内容依赖 XeLaTeX。
- 西文使用 LaTeX 的 Latin Modern，中文使用系统安装的 Noto CJK SC（Debian/Ubuntu 包：`fonts-noto-cjk`）。
- 修改主题、模板或 practice 后必须通过仓库 Makefile 渲染。
- 修改公共主题后运行 `make check`，确保全部文稿可编译。
- 新增可复用素材放入 `shared-assets/`；单份 practice 专用素材放在其 `img/`。
- 不要在 TeX 中依赖远程图片 URL，公开文稿必须可离线构建。
- 检查日志中的 `Overfull`、`Missing character`、`LaTeX Error`、字体和 package warning。
- 涉及版式时将 PDF 页面转为 PNG 联系表，检查空白、重叠、越界、图片变形和字号异常。
