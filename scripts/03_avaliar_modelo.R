# Calcula e exibe a matriz de confusão para avaliar o desempenho do modelo
matriz_confusao <- confusionMatrix(predicoes, teste$defect, positive = "1")
print(matriz_confusao)

# Calcula os dados para a curva ROC (Receiver Operating Characteristic)
roc_obj <- roc(teste$defect, as.numeric(probabilidades))

# Plota a curva ROC
plot(
  roc_obj,
  col = "blue", # Cor da curva
  main = "Curva ROC - Modelo de Regressão Logística", # Título do gráfico
  xlab = "Taxa de Falsos Positivos (1 - Especificidade)", # Rótulo do eixo X
  ylab = "Taxa de Verdadeiros Positivos (Sensibilidade)"  # Rótulo do eixo Y
)

# Calcula e exibe o valor da AUC (Area Under the Curve ROC)
cat("AUC:", auc(roc_obj), "\n")

# Exporta o dataframe 'resultados' para a pasta "output"
write.csv(resultados, "../output/resultados_modelo_logistico.csv", row.names = FALSE)