# Importa o conjunto de dados do arquivo CSV "baseline.csv" na pasta "data"
dados <- read.csv("../data/baseline.csv")

# Remove a coluna 'SHA' do conjunto de dados
dados$SHA <- NULL

# Converte a coluna 'defect' (variável alvo) para o tipo fator
dados$defect <- as.factor(dados$defect)

# Exibe a estrutura do conjunto de dados 'dados' (tipos de colunas, etc.)
str(dados)

# Cria partições para dividir os dados em conjuntos de treino e teste
# Utiliza 70% dos dados para treino (p = 0.7) e 30% para teste
# A divisão é estratificada pela variável 'defect' para manter proporções
divisao <- createDataPartition(dados$defect, p = 0.7, list = FALSE)
treino <- dados[divisao, ]
teste <- dados[-divisao, ]