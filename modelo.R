# Instalar e carregar pacotes necessários
if (!require("caret")) install.packages("caret", dependencies = TRUE)
if (!require("pROC")) install.packages("pROC", dependencies = TRUE)

library(caret)
library(pROC)

# Importa o dataset
dados <- read.csv("data/baseline.csv")

# Remover a coluna SHA
dados$SHA <- NULL

# Transformar a variável alvo em fator
dados$defect <- as.factor(dados$defect)

# Verificar estrutura
str(dados)

# Separar os dados (70% treino, 30% teste)
set.seed(123)
divisao <- createDataPartition(dados$defect, p = 0.7, list = FALSE)
treino <- dados[divisao, ]
teste <- dados[-divisao, ]

# Treinamento do modelo
modelo <- glm(defect ~ ., data = treino, family = binomial)

# Resumo estatístico
summary(modelo)

# Previsões no conjunto de teste
probabilidades <- predict(modelo, newdata = teste, type = "response")
predicoes <- ifelse(probabilidades > 0.5, "1", "0")
predicoes <- as.factor(predicoes)

# Tabela com resultados
resultados <- data.frame(
  prob_falha = round(probabilidades, 3),
  predicao = predicoes,
  real = teste$defect
)

# 10 primeiros resultados
head(resultados, 10)

# Avaliação do desempenho com métricas detalhadas
matriz_confusao <- confusionMatrix(predicoes, teste$defect, positive = "1")
print(matriz_confusao)

# Curva ROC e AUC
roc_obj <- roc(teste$defect, as.numeric(probabilidades))
plot(
  roc_obj,
  col = "blue",
  main = "Curva ROC - Modelo de Regressão Logística",
  xlab = "Taxa de Falsos Positivos (1 - Especificidade)",
  ylab = "Taxa de Verdadeiros Positivos (Sensibilidade)"
)
cat("AUC:", auc(roc_obj), "\n")

# Exportar os resultados
write.csv(resultados, "resultados_modelo_logistico.csv", row.names = FALSE)

#-----------------------------------------------------------
  
# ------ GERAR TABELA 2 ------
  
# Extrair o resumo do modelo
summary_modelo <- summary(modelo)

# Extrair a tabela de coeficientes
tabela_coeficientes <- as.data.frame(summary_modelo$coefficients)

# Renomear as colunas
colnames(tabela_coeficientes) <- c("Estimativa", "Erro_Padrao", "Valor_Z", "P_valor")

# Adicionar uma coluna com os nomes das variáveis
tabela_coeficientes$Variavel <- rownames(tabela_coeficientes)

# Reorganizar as colunas
tabela_coeficientes <- tabela_coeficientes[, c("Variavel", "Estimativa", "Erro_Padrao", "Valor_Z", "P_valor")]

# Exibir a tabela no console
print("Tabela 2: Coeficientes do Modelo de Regressão Logística")
print(tabela_coeficientes)

# Salvar arquivo
write.csv(tabela_coeficientes, "tabela_coeficientes_modelo_logistico.csv", row.names = FALSE)
