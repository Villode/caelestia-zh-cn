#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
data_home="${XDG_DATA_HOME:-$HOME/.local/share}"
bin_dir="${HOME}/.local/bin"
apply_after_install=true

usage() {
    cat <<'EOF'
用法：./install.sh [选项]

选项：
  --no-apply    只安装工具，暂不应用中文补丁
  -h, --help    显示帮助
EOF
}

while (($#)); do
    case "$1" in
        --no-apply) apply_after_install=false ;;
        -h|--help) usage; exit 0 ;;
        *) echo "未知选项：$1" >&2; usage >&2; exit 64 ;;
    esac
    shift
done

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
