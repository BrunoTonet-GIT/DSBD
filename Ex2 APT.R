#-----------------------------------------------------------------------
# Tabela com dados de imóveis contendo a descrição e valores.

url <- "http://leg.ufpr.br/~walmes/data/coberturas-venda-cwb-26Jan2018.txt"
tb_imo <- read.table(url,
                     header = TRUE,
                     sep = "\t",
                     skip = 5,
                     comment.char = "",
                     quote = "\"",
                     encoding = "UTF-8")

# Cria o vetor com a descrição de cada imóvel.
x <- trimws(tb_imo[, c("descr")])

y <- as.data.frame(x)

# Criando um vetor para armazenar o número de seções de cada descrição
secoes <- numeric(length(x))

# Loop for para percorrer as descrições
for (i in seq_along(x)) {
  descricao <- x[i]
  n_caracteres <- nchar(descricao) # obtém o número de caracteres da descrição
  n_secoes <- ceiling(n_caracteres / 50) # obtém o número de seções necessárias
  secoes[i] <- n_secoes # armazena o número de seções no vetor
}

# Criando um dataframe com as informações obtidas
df <- data.frame(descricao = x, secoes = secoes)
