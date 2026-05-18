# HANDOFF — AGENTS.01 → esteira A8S

**Data:** 2026-05-17  
**Tag:** `v0.0.10`  
**Agente:** AGENTS.01 (Environment Orchestrator)

## Status

Setup fundacional concluído. Repositório pronto para materialização de infraestrutura.

## Git

- **Remote:** https://github.com/ggoncalves9/agentsnets-a8s
- **Branch:** `main`
- **Tag:** `v0.0.10`
- **Commit (tag):** `99e583bda924d2ee50d778ceedd86adfaab2cbdb`

## Linear

- **Projeto:** [StratoQuantum](https://linear.app/ggoncalves9/project/stratoquantum-ff8923fe4985/overview)
- **Task Linear:** pendente — `LINEAR_API_KEY` ausente na sessão WSL; criar via MCP Linear (Cursor) ou API e marcar *Done*
- **Rastreio GitHub (sync):** https://github.com/ggoncalves9/agentsnets-a8s/issues/1 — `[Linear-sync] A8S v0.0.10 — Scaffold fundacional (AGENTS.01)`

## Para AGENTS.02 (Executor)

Implementar em:

- `api/crds/` — CRDs `CorporateAgent`, `SandboxWarmPool`
- `cmd/operator/`, `internal/operator/` — skeleton do control loop
- `deploy/kubernetes/*` — operator, sandboxes, warmpool, mcp-sidecar
- `docker/*` — Dockerfiles de exemplo (agent-runtime, neo4j, qdrant)
- `config/samples/` — manifestos de exemplo

**Não** embutir lógica de negócio na imagem; contexto via InitContainer + SDC Git (`CONTEXT.md` §2).

## Para AGENTS.03 (Validator)

Auditar entregas do AGENTS.02 contra `CONTEXT.md`: RBAC, LimitRange/sandbox, Thin Agent, conformidade SDC.

## Para AGENTS.skills (MCP Creator)

Ler `CHECKLIST.md` e `CHANGELOG.md`; criar servidores MCP granulares (Linear, GitHub, DB) conforme pods definidos pelo AGENTS.02.

## Próximo passo

Acionar **AGENTS.02.md** no mesmo workspace após validar tag `v0.0.10` no remote.
