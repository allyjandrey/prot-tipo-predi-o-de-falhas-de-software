# Protótipo de Predição de Falhas de Software com Regressão Logística

Esse é um projeto de conclusão de curso onde foi desenvolvido um modelo de Machine Learning que preve falhas de software baseadas em métricas de código utilizando a técnica estatistica de regressão logística.

## Visão Geral

Este projeto contém uma série de scripts R para tratar, treinar, e avaliar o desempenho de um modelo de Machine Learning. Para garantir a reprodutibilidade e a correta execução, os scripts devem ser rodados na ordem especificada. Os resultados, como tabelas e gráficos, serão salvos na pasta `/output`.

## Pré-requisitos

Antes de começar, certifique-se de que você tem instalado:

* **R:** [https://www.r-project.org/](https://www.r-project.org/)
* **RStudio Desktop:** (Recomendado) [https://posit.co/download/rstudio-desktop/](https://posit.co/download/rstudio-desktop/)

## Como Começar

1.  **Clone o Repositório:**
    ```bash
    git clone https://github.com/allyjandrey/prot-tipo-predi-o-de-falhas-de-software.git
    ```

2.  **Abra o Projeto no RStudio:**
    * Navegue até a pasta raiz do projeto clonado/baixado.
    * Clique duas vezes no arquivo **`scripts.Rproj`**.
    * Isso abrirá o projeto no RStudio, definindo automaticamente o diretório de trabalho correto e garantir que os scripts rodem sem erro.

## Executando os Scripts

Os scripts foram organizados em arquivos diferentes e para serem executados em **ordem sequencial**, você pode rodar todos eles de uma só vez rodando o script do arquivo **`principal.R`**

Ou você também pode rodar eles individualmente vendo o que cada um faz. Mas é crucial que todos sejam executados em ordem para que as dependências entre eles sejam satisfeitas e que o modelo funcione corretamente.

Para executar cada script no RStudio:

* Abra o arquivo `.R` desejado no editor do RStudio.
* Clique no botão **"Source"** no canto superior direito do painel do editor, ou
* Use o atalho `Ctrl+Shift+Enter` (ou `Cmd+Shift+Enter` no macOS) para executar o script inteiro, ou

**Ordem de Execução:**

1.  **`00_setup.R`**
    * **Propósito:** Configuração inicial do ambiente, carregamento de pacotes, definição de funções auxiliares e variáveis globais.
    * **Verifique:** Se os pacotes foram carregados sem erros.

2.  **`01_carregar_preparar_dados.R`**
    * **Propósito:** Carregamento dos dados brutos, limpeza, transformações e preparação para análise/modelagem.
    * **Verifique:** Se os dataframes esperados foram criados no ambiente do R (painel "Environment").

3.  **`02_treinar_modelo_e_prever.R`**
    * **Propósito:** Treinamento do(s) modelo(s) estatístico(s) ou de machine learning e geração de previsões, se aplicável.
    * **Verifique:** Se o objeto do modelo foi criado e se as previsões foram geradas.

4.  **`03_avaliar_modelo.R`**
    * **Propósito:** Avaliação da performance do(s) modelo(s) treinado(s) utilizando métricas apropriadas.
    * **Verifique:** As saídas no console (métricas de avaliação) ou gráficos gerados.

5.  **`04_gerar_tabela_coeficientes.R`**
    * **Propósito:** Geração de tabelas finais de resultados, como coeficientes do modelo, sumarizações importantes, etc.
    * **Verifique:** A pasta `/output` para os arquivos gerados.

## Saídas (Outputs)

Todos os resultados principais gerados pelos scripts, como tabelas (em formatos como `.csv`), gráficos (`.png`, `.pdf`) e outros artefatos, serão salvos automaticamente na pasta `/output` dentro do diretório do projeto.
