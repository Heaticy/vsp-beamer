# Development

## 平台策略

项目仅维护 Linux。Ubuntu/Debian 是 CI 与发布验证基线；不接受仅用于 macOS 或 Windows 兼容的复杂度。安装和升级脚本可以依赖 GNU/Linux 提供的 `readlink -f`、`mv -T`、`timeout` 和 Fontconfig。

## 构建管线

仓库只依赖 GNU Make 和标准 TeX 工具链。

单文稿入口：

```bash
make render INPUT=<input.tex> [OUTPUT=output.pdf]
```

全量入口：

```bash
make
make check
```

`make` 默认调用 `scripts/check-update.sh` 做一次每日 upstream 检查，然后进入构建；该检查有超时、缓存和失败静默行为。设置 `VSP_SKIP_UPDATE_CHECK=1` 可以关闭。显式升级命令分工如下：仓库 checkout 使用 `make upgrade`，已安装运行时使用 `vsp-beamer update`。

`make check` 在全量构建后扫描日志并拒绝：

- `Overfull`：内容越界
- `Missing character`：字体缺字
- `LaTeX Error`：LaTeX 错误
- `LaTeX Font Warning`：字体形状或回退警告
- package warning：主题或依赖包警告

## 用户级运行时包

`make install` 将当前 bundle 安装到 `TEXMFHOME`，包括主题入口、共享主题、背景、Logo 和 Nailong 图片。Noto CJK 作为系统依赖提供，不重复进入 TDS 包；Debian/Ubuntu 使用 `sudo apt install fonts-noto-cjk`。安装器使用版本化 release 和 `current` 链接，升级时原子切换，上一版保留在 `previous`：

```bash
make install
make status
make verify-install
make rollback
make uninstall
```

安装不会覆盖仓库外的模板或用户文稿。安装后可从任意目录使用：

```bash
vsp-beamer update --from /path/to/vsp-beamer
vsp-beamer update
```

`--from` 用于无 remote 或离线环境；远程更新读取安装时记录的 `origin`。远程升级在当前仓库没有 remote 的环境中无法端到端测试，但本地升级路径使用同一原子安装和验证逻辑。

`themes/beamerthemeVSP.sty` 是共享实现，负责：

- 红、紫、奶龙黄三套配色
- tutorial 与 report 两类封面
- ShanghaiTech Logo 和正文背景变体
- 标题、页脚、页码、章节页、列表、block、代码和尾页
- Latin Modern 西文字体与系统 Noto CJK SC 中文字体

其余 `themes/beamertheme*.sty` 是命名入口。

## 新增文稿

1. 使用现有 `templates/*.tex` 作为结构参考。
2. 图片使用仓库相对路径。
3. 执行 `make render INPUT=<file>`。
4. 将 PDF 转成图片并逐页检查版式。
5. 执行 `make check`。

## 发布主题

在其他仓库手工使用时，需要一起提供：

- `themes/beamerthemeVSP.sty`
- 对应的 `themes/beamertheme<name>.sty`
- 主题所需的背景或 Logo 素材

系统还需安装 Noto CJK SC 字体。

也可以保持当前目录结构，把本仓库作为 presentation 工程直接使用。
