#!/usr/bin/env bash
set -u

[[ "${VSP_SKIP_UPDATE_CHECK:-0}" == 1 ]] && exit 0
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || exit 0
remote="$(git config --get remote.origin.url 2>/dev/null || true)"
[[ -n "$remote" ]] || exit 0
branch="$(git symbolic-ref --quiet --short HEAD 2>/dev/null || true)"
[[ -n "$branch" ]] || exit 0

cache_root="${XDG_CACHE_HOME:-$HOME/.cache}/vsp-beamer"
cache_file="$cache_root/update-check"
now="$(date +%s)"
if [[ -f "$cache_file" ]]; then
  last="$(cat "$cache_file" 2>/dev/null || printf 0)"
  if [[ "$last" =~ ^[0-9]+$ ]] && (( now - last < 86400 )); then
    exit 0
  fi
fi
mkdir -p "$cache_root" 2>/dev/null || exit 0
printf '%s\n' "$now" > "$cache_file" 2>/dev/null || true

remote_head="$(timeout "${VSP_UPDATE_CHECK_TIMEOUT:-3}" git ls-remote "$remote" "refs/heads/$branch" 2>/dev/null | awk 'NR == 1 { print $1 }')"
local_head="$(git rev-parse HEAD 2>/dev/null || true)"
[[ -n "$remote_head" && -n "$local_head" && "$remote_head" != "$local_head" ]] || exit 0

cat <<EOF
[VSP-Beamer] Upstream changes may be available.
  Git checkout: make upgrade
  User install: vsp-beamer update
  Disable this daily check with VSP_SKIP_UPDATE_CHECK=1 make
EOF
