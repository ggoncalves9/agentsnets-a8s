# CHECKLIST — AGENTS.01 (Setup fundacional)

## Fase 0 — Pré-voo

- [x] `gh auth status` e acesso ao repositório `ggoncalves9/agentsnets-a8s`
- [x] MCP Linear configurado em `~/.cursor/mcp.json` (sessão Cursor pode exigir restart para expor tools)

## Fase 1 — Planejamento

- [x] Leitura de `CONTEXT.md`
- [x] Plano de diretórios definido

## Fase 2 — Linear

- [x] Rastreio criado (GitHub #1 — sync até MCP/API Linear): https://github.com/ggoncalves9/agentsnets-a8s/issues/1
- [ ] Task Linear nativa criada e marcada *Done* (requer `LINEAR_API_KEY` ou login MCP)

## Fase 3 — Scaffold e versionamento

- [x] Árvore `api/`, `cmd/`, `internal/`, `pkg/`
- [x] Árvore `config/`, `deploy/kubernetes/`, `docker/`
- [x] Árvore `docs/architecture/`, `scripts/setup/`
- [x] `README.md`, `CHANGELOG.md`, `.gitignore`
- [x] Git init, commits atômicos, tag `v0.0.10`, push `main` + tag

## Fase 4 — Handoff

- [x] `HANDOFF.md` preenchido com SHA (`99e583b`)
- [x] Esteira liberada para AGENTS.02 / AGENTS.03 / AGENTS.skills

---

# CHECKLIST — AGENTS.03 (Validador)

## Rodada 2026-05-17

- [x] Leitura de `CONTEXT.md` e `HANDOFF.md`
- [x] Varredura de `api/`, `config/`, `deploy/`, `docker/`, `cmd/`, `internal/`
- [x] Relatório `AUDIT.md` — veredito **REPROVADO**
- [x] Entrada em `CHANGELOG.md` (seção Unreleased)
- [ ] Re-auditoria após primeiro commit do AGENTS.02
- [ ] Validação RBAC / LimitRange / InitContainer SDC em manifestos reais
- [ ] Ambiente de exemplo aplicável sem erro (`dry-run` ou cluster dev)
- [ ] Encerrar tasks Linear e sprint (após aprovação)
