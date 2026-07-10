# Caelestia 简体中文补丁

为 [Caelestia Shell](https://github.com/caelestia-dots/shell) 提供简体中文界面。

本仓库只包含中文补丁和安装工具，不包含完整的 Caelestia 源码，也不包含任何本机配置、缓存或个人资料。

## 兼容性

- 已适配：`caelestia-shell 2.1.0` 和 Villode 受控分支
- 系统：Arch Linux / 基于 Arch 的发行版
- 依赖：`bash`、`patch`、`rsync`

补丁直接修改 QML 界面文本，因此上游升级后可能需要重新适配。应用前不会修改 `/etc` 下的系统文件，而是使用用户配置副本。

在 [Villode Caelestia](https://github.com/Villode/villode-caelestia) 中使用时，基础 Shell
来自 [Villode/caelestia-shell](https://github.com/Villode/caelestia-shell) 的锁定版本；上游升级不会绕过适配测试直接进入整合安装器。

## 安装

请先安装并确认 Caelestia Shell 可以正常启动，然后执行：

```bash
git clone https://github.com/Villode/caelestia-zh-cn.git
cd caelestia-zh-cn
./install.sh
```

只安装工具、暂不应用：

```bash
./install.sh --no-apply
```

## 使用

重新应用当前版本的补丁：

```bash
caelestia-zh-apply
```

Caelestia 更新后，建议从新版系统源码重新生成用户副本：

```bash
caelestia-zh-apply --refresh
```

`--refresh` 会先把现有用户副本备份为带时间戳的目录，再复制新版源码并应用补丁。它不会覆盖备份。

仅应用补丁，不自动重启：

```bash
caelestia-zh-apply --no-restart
```

## 卸载

```bash
./uninstall.sh
```

卸载脚本只删除本仓库安装的命令和补丁，不会删除 `~/.config/quickshell/caelestia`，避免误删个人修改。

## 翻译范围

当前补丁覆盖文件对话框、状态栏弹窗、仪表盘、启动器、锁屏、Nexus 设置页、侧边栏和实用工具等界面。

## 上游与许可

Caelestia Shell 由 Caelestia 项目维护。本项目不是官方中文版本。

本项目基于 GPL-3.0-only 的 Caelestia Shell 修改并以 GPL-3.0 许可发布，详见 [LICENSE](LICENSE)。修改内容已明确以独立补丁形式提供。
