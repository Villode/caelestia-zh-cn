#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
data_home="${XDG_DATA_HOME:-$HOME/.local/share}"
bin_dir="${HOME}/.local/bin"
apply_after_install=true

if [[ "${1:-}" == "--no-apply" ]]; then
    apply_after_install=false
elif (($#)); then
    echo "用法：./install.sh [--no-apply]" >&2
    exit 64
fi

install -Dm644 \
    "$repo_dir/patches/zh-cn-ui.patch" \
    "$data_home/caelestia-zh-cn/patches/zh-cn-ui.patch"
install -Dm755 \
    "$repo_dir/bin/caelestia-zh-apply" \
    "$bin_dir/caelestia-zh-apply"

echo "已安装：$bin_dir/caelestia-zh-apply"
echo "中文补丁：$data_home/caelestia-zh-cn/patches/zh-cn-ui.patch"

if $apply_after_install; then
    "$bin_dir/caelestia-zh-apply"
fi
