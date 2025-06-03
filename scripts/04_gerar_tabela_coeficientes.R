# ------ GERAR TABELA 2: Coeficientes do Modelo de Regressão Logística ------

# Obtém o resumo completo do modelo 'modelo' (treinado anteriormente)
summary_modelo <- summary(modelo)

# Extrai a tabela de coeficientes (estimativas, erros padrão, etc.) do resumo do modelo
tabela_coeficientes <- as.data.frame(summary_modelo$coefficients)

# Renomeia as colunas da tabela de coeficientes para nomes mais descritivos
colnames(tabela_coeficientes) <- c("Estimativa", "Erro_Padrao", "Valor_Z", "P_valor")

# Adiciona uma nova coluna chamada 'Variavel' à tabela,a
# contendo os nomes das variáveis preditoras (que são os nomes das linhas da tabela original de coeficientes)
tabela_coeficientes$Variavel <- rownames(tabela_coeficientes)

# Reorganiza a ordem das colunas na tabela 'tabela_coeficientes'
# A coluna 'Variavel' é movida para a primeira posição
tabela_coeficientes <- tabela_coeficientes[, c("Variavel", "Estimativa", "Erro_Padrao", "Valor_Z", "P_valor")]

# Exibe um título no console para a tabela
print("Tabela 2: Coeficientes do Modelo de Regressão Logística")
# Exibe a tabela 'tabela_coeficientes' formatada no console
print(tabela_coeficientes)

# Salva a 'tabela_coeficientes' para a pasta "output"
write.csv(tabela_coeficientes, "../output/tabela_coeficientes_modelo_logistico.csv", row.names = FALSE)