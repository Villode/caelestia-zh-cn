# Caelestia 简体中文翻译包

为 [Villode Caelestia Shell](https://github.com/Villode/caelestia-shell) 提供简体中文界面翻译。

翻译采用 Qt Linguist 的 `TS`/`QM` 目录，在运行时由 Shell 加载。它不再修改 QML 源码，因此 Shell 更新不会产生补丁冲突；用户也可以在“设置 → 语言和地区”中立即切换“跟随系统”“简体中文”或 English，无需重启。

## 兼容性

- 需要带运行时翻译框架的 Villode Caelestia Shell
- 系统：Arch Linux / 基于 Arch 的发行版
- 运行依赖：`bash`、`python3`、`flock`

Villode 整合安装器会锁定并组合测试 Shell 与翻译包版本。


## 运行要求（重要）

翻译目录（`.qm`）必须由 **Villode 自带的 Caelestia 原生插件** 中的 `TranslationManager` 加载。

- 安装 Shell 时请使用 `install-villode.sh`（**不要**加 `--no-native-build`）
- 启动请使用 `caelestia shell` / `villode-caelestia-shell-guard`，确保 `QML2_IMPORT_PATH` 包含 `~/.local/lib/qt6/qml`
- 系统包 `/usr/lib/qt6/qml/Caelestia` 通常过旧，不含 `TranslationManager`，会导致设置页全英文

检查：

```bash
caelestia-zh-apply --check
qs -c caelestia ipc call uilanguage status   # Shell 运行中
```

目录源：Shell 仓库 `i18n/` 为真相源；本仓库在发版时同步 `.ts` / `.qm` / `zh_CN.json`。

## 安装

先安装 Villode Caelestia Shell，然后执行：

```bash
git clone https://github.com/Villode/caelestia-zh-cn.git
cd caelestia-zh-cn
./install.sh
```

只安装翻译包和工具、暂不切换语言：

```bash
./install.sh --no-apply
```

重新安装翻译目录并选择简体中文：

```bash
caelestia-zh-apply
```

只检查指定 Shell 是否支持翻译包：

```bash
caelestia-zh-apply --check --source /path/to/caelestia-shell
```

兼容时返回 `0`，Shell 版本过旧时返回 `65`。`--refresh` 作为旧版命令的兼容别名保留，`--no-restart` 可避免自动重启 Shell。

## 翻译文件

- `i18n/qml_zh_CN.ts`：可编辑的 Qt Linguist 翻译源
- `i18n/qml_zh_CN.qm`：Shell 实际加载的二进制目录
- `i18n/zh_CN.json`：项目自定义翻译映射，用于更新 TS

## 卸载

```bash
./uninstall.sh
```

卸载只删除本仓库安装的工具和翻译包副本，不删除 Shell 配置。之后可在 Shell 设置里改回 English 或跟随系统。

## 上游与许可

Caelestia Shell 由 Caelestia 项目维护。本项目不是官方中文版本。

本项目按 GPL-3.0 许可发布，详见 [LICENSE](LICENSE)。
