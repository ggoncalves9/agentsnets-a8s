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
- **Commit (tag):** _preencher após push_

## Linear

- **Projeto:** [StratoQuantum](https://linear.app/ggoncalves9/project/stratoquantum-ff8923fe4985/overview)
- **Task:** _preencher ID/URL após criação_

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
