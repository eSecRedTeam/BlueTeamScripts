# Hardening Windows 10

Baseado em: CIS_Microsoft_Windows_10_Enterprise_Benchmark_v2.0.0 (L1)

Referência: [Clique aqui para fazer o download](https://learn.cisecurity.org/l/799323/2023-03-15/4sslj7?_gl=1*cmkiop*_ga*MTMwODQ3NDM5OS4xNjkyMTA3MTYx*_ga_N70Z2MKMD7*MTY5NDYxOTgxMy45LjAuMTY5NDYxOTgxMy42MC4wLjA.*_ga_ZQVR7NM9HJ*MTY5NDYxOTgxMy45LjAuMTY5NDYxOTgxMy4wLjAuMA..)

# Observações Gerais

Recomendamos que o processo **não seja implementado diretamente em produção**. O ideal é que a politica seja implementada diretamente em uma estação de trabalho ou utilize o controlador de domínio para implementar a políticaem um conjunto de máquinas selecionadas para testes.

A política tem a função de realizar ajustes de segurança nos sistemas, sendo assim é natural que alguns recursos não estejam mais disponiveis ou sofram alguma alteração. Por este motivo é de extrema importància que tudo seja completamente testado em varias situações antes de implementar para todo o ambiente.

Dito isso, vamos à implementação.

# Instruções

Acesse o controlador de domínio responsável por fornecer as configurações para as estações de trabalho do ambiente.

### Arquivos necessários

Baixe os arquivos fornecidos neste repositório.

### Implemente os templates administrativos

1. Acesse a pasta do servidor onde ficam armazenados os templates administrativos. Por padrão encontramos eles em: "C:\Windows\PolicyDefinitions"

2. Substitua os arquivos fornecidos pelos arquivos padrões encontrados na pasta padrão. Tanto para os arquivos de política (.admx), qaunto para os respectivos arquivos de linguagem (.adml)

> Todos os templates administrativos são oficiais da Microsoft e em sua maioria são as versões mais atualizadas implementadas nas ultimas versões do sistema operacional, como o Windows 11 Release 2H22

### Importar política

Com todos os templates implementados, siga para criação da política.

1. Acesse "Group Policy Management"

2. Crie uma política de grupo "CIS_Win10_Enterprise_v2.0.0_L1"

3. Clique com o botão direito na política criada e va até a opção "Import Settings"

4. Através do Assistente, clique em "next" > "next" > Selecione o local do arquivo > "next" > Selecione a política disponivel > "next" > "next" > "Finish"

5. Pronto, agora basta aplicar a política criada às unidade organizacionais adequadas.
