# Treina um modelo de regressão logística (Generalized Linear Model - glm)
modelo <- glm(defect ~ ., data = treino, family = binomial)

# Exibe um resumo estatístico detalhado do modelo treinado (coeficientes, significância, etc.)
summary(modelo)

# Gera previsões de probabilidade para a classe "defect" no conjunto de teste
probabilidades <- predict(modelo, newdata = teste, type = "response")

# Converte as probabilidades em predições de classe ("1" ou "0")
# Utiliza um limiar de decisão de 0.5 - valor padrão
predicoes <- ifelse(probabilidades > 0.5, "1", "0")
# Converte as predições para o tipo fator
predicoes <- as.factor(predicoes)

# Cria um dataframe chamado 'resultados' contendo:
# - prob_falha: probabilidades de falha arredondadas para 3 casas decimais
# - predicao: a classe predita pelo modelo
# - real: a classe real (verdadeira) do conjunto de teste
resultados <- data.frame(
  prob_falha = round(probabilidades, 3),
  predicao = predicoes,
  real = teste$defect
)

# Exibe as 10 primeiras linhas do dataframe 'resultados'
head(resultados, 10)