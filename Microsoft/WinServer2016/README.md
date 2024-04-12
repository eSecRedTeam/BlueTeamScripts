# Hardening Windows Server 2016

Baseado em: CIS Microsoft Windows Server 2016 Benchmark v2.0.0 (L1)

Referência: [Clique aqui para fazer o download](https://learn.cisecurity.org/l/799323/2023-04-05/4sv5s2?_gl=1*1gnwr26*_ga*MTMwODQ3NDM5OS4xNjkyMTA3MTYx*_ga_N70Z2MKMD7*MTY5ODE1NjcxMi4xNi4xLjE2OTgxNTgyNDkuNjAuMC4w*_ga_ZQVR7NM9HJ*MTY5ODE1NjcxMi4xNi4xLjE2OTgxNTgyNDkuMC4wLjA.)

# Observações Gerais

Recomendamos que o processo **não seja implementado diretamente em produção**. O ideal é que a politica seja implementada diretamente em uma estação de trabalho ou utilize o controlador de domínio para implementar a políticaem um conjunto de máquinas selecionadas para testes.

A política tem a função de realizar ajustes de segurança nos sistemas, sendo assim é natural que alguns recursos não estejam mais disponiveis ou sofram alguma alteração. Por este motivo é de extrema importància que tudo seja completamente testado em varias situações antes de implementar para todo o ambiente.

Dito isso, vamos à implementação.

# Instruções

Acesse o controlador de domínio responsável por fornecer as configurações para dispositivos Windows do ambiente.

### Arquivos necessários

1. Para controladores de domínio deve ser implementado a política "Domain" (CIS_Win2016_v2.0.0_Domain_L1). Para os demais, implemente a política "Member" (CIS_Win2016_v2.0.0_Member_L1).

2. Baixe os arquivos fornecidos neste repositório.

### Implemente os templates administrativos

1. Acesse a pasta do servidor onde ficam armazenados os templates administrativos. Por padrão encontramos eles em: "C:\Windows\PolicyDefinitions"

2. Substitua os arquivos fornecidos pelos arquivos padrões encontrados na pasta padrão. Tanto para os arquivos de política (.admx), qaunto para os respectivos arquivos de linguagem (.adml)

> Todos os templates administrativos são oficiais da Microsoft e em sua maioria são as versões mais atualizadas implementadas nas ultimas versões do sistema operacional, como o Windows 11 Release 2H22

### Importar política

Com todos os templates implementados, siga para criação da política.

1. Acesse "Group Policy Management"

2. Crie uma política de grupo "CIS_Win2016_v2.0.0_Member_L1"

3. Clique com o botão direito na política criada e va até a opção "Import Settings"

4. Através do Assistente, clique em "next" > "next" > Selecione o local do arquivo > "next" > Selecione a política disponivel > "next" > "next" > "Finish"

5. Pronto, agora basta aplicar a política criada às unidade organizacionais adequadas.
