# agentsnets-a8s (A8S)

Motor **AgentsNets** (`a8s`) — segundo plano de controle em Kubernetes para a camada de agentes de IA do **StratoQuantum**.

## O que é este repositório

- Estende o cluster com CRDs (`CorporateAgent`, `SandboxWarmPool`) e um operator de reconciliação.
- Acopla agentes efêmeros (*Thin Agent / Fat Platform*) à especificação SDC versionada no Git.
- Integra ferramentas via MCP em sidecars, com isolamento por sandbox.

## Tag v0.0.10

Entrega fundacional **AGENTS.01**: apenas scaffold de diretórios, documentação de orquestração e versionamento. **Sem CRDs funcionais, sem Dockerfiles executáveis e sem código de operator nesta tag.**

## Documentação

| Arquivo | Propósito |
|---------|-----------|
| [CONTEXT.md](CONTEXT.md) | Matriz arquitetural (fonte da verdade) |
| [AGENTS.01.md](AGENTS.01.md) | Setup / orquestração de ambiente |
| [AGENTS.02.md](AGENTS.02.md) | Executor de infraestrutura |
| [AGENTS.03.md](AGENTS.03.md) | Validador de conformidade |
| [AGENTS.skills.md](AGENTS.skills.md) | Criador de servidores MCP |
| [CHECKLIST.md](CHECKLIST.md) | Progresso do setup |
| [CHANGELOG.md](CHANGELOG.md) | Histórico de versões |
| [HANDOFF.md](HANDOFF.md) | Passagem para os próximos agentes |
| [AUDIT.md](AUDIT.md) | Relatório do validador (AGENTS.03) |

## Links StratoQuantum

- SDC: https://github.com/ggoncalves9/stratoquantum.sdc
- MCP Server: https://github.com/ggoncalves9/stratoquantum.mcp.server
- Linear (projeto): https://linear.app/ggoncalves9/project/stratoquantum-ff8923fe4985/overview
