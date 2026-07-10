#!/usr/bin/env bash
set -euo pipefail

data_home="${XDG_DATA_HOME:-$HOME/.local/share}"
bin_file="${HOME}/.local/bin/caelestia-zh-apply"
data_dir="$data_home/caelestia-zh-cn"

rm -f "$bin_file"
rm -rf "$data_dir"

echo "已卸载 Caelestia 中文补丁工具。"
echo "现有用户配置未被删除：${XDG_CONFIG_HOME:-$HOME/.config}/quickshell/caelestia"
echo "如需恢复原版，请先备份个人修改，再删除该目录并重新启动 Caelestia。"
