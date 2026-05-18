#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../.."

if [[ ! -d .git ]]; then
  git init
  git remote add origin https://github.com/ggoncalves9/agentsnets-a8s.git 2>/dev/null || git remote set-url origin https://github.com/ggoncalves9/agentsnets-a8s.git
fi

git add CONTEXT.md AGENTS.01.md AGENTS.02.md AGENTS.03.md AGENTS.skills.md
git commit -m "$(cat <<'EOF'
docs: add CONTEXT and AGENTS orchestration specs

EOF
)" || true

git add api/ cmd/ internal/ pkg/
git commit -m "$(cat <<'EOF'
chore: scaffold api/cmd/internal/pkg directory layout

EOF
)" || true

git add config/ deploy/
git commit -m "$(cat <<'EOF'
chore: scaffold config and deploy/kubernetes layout

EOF
)" || true

git add docker/ docs/ scripts/
git commit -m "$(cat <<'EOF'
chore: scaffold docker and docs placeholders

EOF
)" || true

git add README.md CHANGELOG.md CHECKLIST.md HANDOFF.md .gitignore
git commit -m "$(cat <<'EOF'
docs: add CHANGELOG, CHECKLIST, README, and HANDOFF

EOF
)" || true

git branch -M main
git tag -a v0.0.10 -m "Foundation scaffold — AGENTS.01" 2>/dev/null || git tag -f -a v0.0.10 -m "Foundation scaffold — AGENTS.01"
git push -u origin main
git push origin v0.0.10

git rev-parse v0.0.10^{commit}
