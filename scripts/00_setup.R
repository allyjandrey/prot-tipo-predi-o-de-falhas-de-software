# Instala os pacotes 'caret' e 'pROC' se ainda não estiverem instalados
if (!require("caret")) install.packages("caret", dependencies = TRUE)
if (!require("pROC")) install.packages("pROC", dependencies = TRUE)

# Carrega os pacotes 'caret' e 'pROC' para a sessão atual
library(caret)
library(pROC)

# Define a semente aleatória para garantir a reprodutibilidade dos resultados
set.seed(123)