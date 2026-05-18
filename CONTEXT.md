# [CONTEXT.md](http://CONTEXT.md): STRATOQUANTUM (A8S ENGINE) - ARQUITETURA COGNITIVA E ACOPLAMENTO KUBERNETES

<system_directives> MODO: Read-Only. NATUREZA: Este documento define a matriz estática de conhecimento arquitetural e a lógica de acoplamento Kubernetes (K8s) para a rede de agentes corporativos, batizada de AgentsNets ou "A8S". Qualquer geração de código deve aderir estritamente a estas primitivas de infraestrutura. </system_directives>  
  
AgentsNets = A8S  
Sempre usar a sigla dentro do ambiente: a8s  
AgentsNets é usado para explicações  
StratoQuantum é a camada externa de negocios, com contexto, skills e hardness

## 1. O Motor de Orquestração: A8S Operator e CRDs

O AgentsNets é o motor acoplato em Kubernetes do StratoQuantum (parte da aplicação). o A8S não roda como scripts Python isolados; ele é um Segundo Plano de Controle acomplado no Kubernetes consumindo a sua estrutura e criando a camada de Agentes de Inteligencia Artificial.

- **CRD (Custom Resource Definition):** O sistema estende a API do Kubernetes introduzindo o recurso `kind: CorporateAgent`. Os agentes de IA são tratados como recursos de primeira classe, garantindo que possuam identidade própria, autorização RBAC e trilhas de auditoria nativas.
- **A8S Operator (Control Loop):** Um Operator customizado monitora continuamente o cluster em busca de novos manifestos `CorporateAgent`. Seu papel é reconciliar o estado desejado da CRD com o estado atual da aplicação, automatizando a criação, o escalonamento e a destruição dos Pods dos agentes.

## 2. Injeção de Contexto via InitContainers

A inteligência e as regras de negócio não são "embutidas" na imagem Docker (que deve ser um *runtime* genérico e leve). O contexto é montado dinamicamente:

- Quando o Operator provisiona um Pod, ele utiliza **InitContainers**.
- A função do InitContainer é executar um clone dos repositórios Git contendo as regras de negócio SDC (Spec Driven Corporate)([https://github.com/ggoncalves9/stratoquantum.sdc](https://github.com/ggoncalves9/stratoquantum.sdc)) e montá-las em um `Volume` compartilhado.
- Quando o contêiner principal do agente inicializa, ele lê essas especificações locais, garantindo que a execução seja guiada pela especificação estática atualizada.

## 3. Isolamento, Segurança e Agent Sandboxing

Agentes que geram e executam código ou navegam na web exigem contenção extrema para não comprometerem o cluster.

- **Agent Sandbox:** O sistema provisiona ambientes de execução efêmeros e isolados. Cada sandbox é um ambiente contido por *namespace* com limites rígidos de recursos (CPU/Memória) estabelecidos via `LimitRanger` para evitar o esgotamento do cluster (efeito *noisy-neighbor*).
- **Muralhas Específicas:** Para tarefas de pesquisa, utiliza-se um "Chrome Sandbox" isolado, permitindo que os agentes extraiam dados de portais web sem que tenham acesso direto à rede interna sensível.
- **Sidecars de Identidade:** A plataforma injeta automaticamente contêineres do tipo *sidecar* para gerenciar a identidade e o registro do agente, garantindo que toda comunicação externa seja autenticada e auditável.

## 4. Otimização de Latência: SandboxWarmPool

Um dos maiores gargalos na orquestração de IA no K8s é o "Cold Start" (o tempo que o Kubernetes leva para puxar a imagem e iniciar um novo Pod, que costuma levar cerca de um segundo).



- **Mitigação:** O AgentsNets implementa uma CRD auxiliar chamada `SandboxWarmPool`.
- **Funcionamento:** O cluster mantém um pool contínuo de Pods de sandbox pré-provisionados em estado de espera (warm). Quando o A8S Operator precisa de um novo agente, ele simplesmente acopla a requisição a um Pod já "quente", reduzindo a latência de inicialização para a casa dos milissegundos.

## 5. Acoplamento de Ferramentas: Model Context Protocol (MCP)

- O acesso a APIs, repositórios (Linear, GitHub) e Bancos de Dados (Neo4j, Qdrant) não ocorre por SDKs embutidos, mas sim através do Model Context Protocol. Um pod com as diretrizes alocadas no Repositorio Github Strato Quantum MCP Server ([https://github.com/ggoncalves9/stratoquantum.mcp.server](https://github.com/ggoncalves9/stratoquantum.mcp.server))
- Os servidores MCP atuam como um novo serviço de rede em um novo Container no Pod do agente e acesso livre do agente para requisições. O agente descobre as ferramentas de acordo com seua espesificação do github com seu SystemPrompt e [Skills.md](http://Skills.md) ([https://github.com/ggoncalves9/stratoquantum.agt001](https://github.com/ggoncalves9/stratoquantum.agt001)) e contexto do SDC (Spec Driven Corporate)([https://github.com/ggoncalves9/stratoquantum.sdc](https://github.com/ggoncalves9/stratoquantum.sdc)) e deve ser roteado pelo K8s de forma segura, garantindo o Princípio do Menor Privilégio.
- **Prevenção do Paradoxo de Contexto:** Ao usar servidores MCP locais restritos, o agente recebe apenas o schema das ferramentas que precisa naquele exato momento, poupando a janela de contexto de sua "memória de trabalho".  
  
  
--- Sessão sobre logica de negocio e conceitos do projeto  
  
 STRATOQUANTUM (A8S ENGINE) - ARQUITETURA COGNITIVA

MODO: Read-Only. NATUREZA: Este documento atua como a matriz de conhecimento estático para a rede de agentes corporativos. Desvios deste contexto arquitetural são categorizados como falha crítica.

## 1. Fundamentos do Sistema: SDC (Spec Driven Corporate)

O StratoQuantum repudia o *prompt engineering* ad-hoc e desestruturado. Toda a operação é baseada no modelo SDC, onde as especificações de negócio são documentos executáveis versionados no Git.

- Os agentes não inventam fluxos; eles leem as especificações, geram a execução baseada nelas, atualizam o estado de trabalho e comitam de volta.

## 2. Paradigma Arquitetural: "Thin Agent / Fat Platform"

O sistema ataca o Paradoxo da Capacidade-Contexto (Context-Capability Paradox). Para realizar tarefas complexas, agentes não devem ser monolitos sobrecarregados de instruções que degradam a janela de contexto do LLM.

- **Agentes Efêmeros:** Cada agente (*spawn*) possui menos de 150 linhas lógicas, nascendo sem memória de tentativas passadas para evitar contaminação cruzada de contexto.
- **Roteamento de Skills (JIT):** Habilidades e ferramentas MCP não são carregadas globalmente; elas são injetadas no ambiente do agente no momento exato da execução (*Just-in-Time*), guiadas por um Gateway de roteamento.
- **Exclusividade de Ferramentas:** Ferramentas de delegação e execução são mutuamente exclusivas. Se um agente coordena e despacha tarefas, ele perde o acesso de escrita, forçando o comportamento determinístico.

## 3. Kubernetes Agent Sandbox e CRDs

A inteligência artificial opera como um serviço de rede (HTTP/RPC) dentro do cluster. O A8S estende as primitivas nativas do ecossistema:

- **Custom Resource Definitions (CRD):** Workloads de agentes são instanciados como recursos de primeira classe do Kubernetes através de CRDs, tratando o agente de IA com as mesmas necessidades de um microsserviço (identidade, RBAC, auditoria).
- **Sandboxing:** Agentes operam em ambientes isolados (namespaces dedicados) com acesso contido. Ferramentas que requerem navegação (ex: Chrome Sandbox) rodam isoladas, mitigando o risco de acessos não autorizados à infraestrutura local.

## [DESCONTINUED] 4. Estrutura Cognitiva: Cérebro Duplo (GraphRAG)

Para raciocínio complexo que exige conexões estruturais, a arquitetura abandona o RAG vetorial plano e adota um padrão de GraphRAG composto por dois motores simultâneos:

- **Qdrant (Memória Semântica):** Banco de dados vetorial utilizado para pesquisa de similaridade de alta performance, identificando rapidamente pontos de dados e documentos através de *embeddings* sem necessidade de correspondência exata de palavras.
- **Neo4j (Memória de Contexto / Estrutural):** O banco de grafos recebe as entidades (IDs) extraídas do banco vetorial e realiza a travessia das relações (Cypher queries), expandindo o contexto estrutural para que o modelo entenda causa e efeito antes da geração da resposta.

## [DESCONTINUED]  5. Conectividade Segura: Model Context Protocol (MCP)

As integrações do StratoQuantum com aplicações de terceiros (Linear, Bancos de Dados, Repositórios) são estritamente governadas pelo MCP.

- O protocolo estabelece uma comunicação clara via JSON-RPC 2.0 dividida em três pilares: o *Host* (A aplicação LLM/Agente), os *Clients* (Conectores de ponte), e os *Servers* (Os serviços que retêm os dados e as capacidades).
- Todo o tráfego de contexto, requisição de ações e execução de código deve fluir pelos servidores MCP, garantindo o "Princípio do Menor Privilégio".

## 6. Telemetria e Eficiência de Rede (gRPC)

Em ambientes distribuídos multi-agentes, o custo cognitivo e financeiro (uso de tokens) dita a escalabilidade.

- O StratoQuantum proíbe o uso da camada 7 da rede (REST APIs padrão com payloads em JSON longos) para comunicação interna de telemetria entre agentes, devido à severa degradação de performance para dados volumosos.
- A rede interna adota **gRPC com Protocol Buffers**, provendo uma taxa de transferência muito superior, resiliência no roteamento sob cargas altas e compressão binária, o que reduz drasticamente o consumo do LLM.

