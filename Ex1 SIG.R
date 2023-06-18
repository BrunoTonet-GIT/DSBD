
#-----------------------------------------------------------------------
# Dados de data de nascimento de jogadores.

url <- "http://leg.ufpr.br/~walmes/data/jog_europaleague_2014-05-04.txt"

tb_play <- read.table(url,
                      header = TRUE,
                      sep = "\t",
                      comment = "#",
                      quote = "")

# Data de nascimento.
tb_play$DateOfBirth <- as.Date(tb_play$DateOfBirth)

tb_play <- tb_play[!is.na(tb_play$DateOfBirth),
                   c("FirstName", "DateOfBirth")]
str(tb_play)

# Dia juliano ou dia do ano, de 1 a 365 ou 366.
tb_play$dia_ano <-
  as.integer(strftime(tb_play$DateOfBirth,
                      format = "%j"))
head(tb_play)

# O vetor tb_play$DateOfBrith é o dia de nascimento de cada jogador. O vetor tb_play$dia_ano é o correspondente dia do ano, uma variável que vai de 1 a 365, ou 366 quando o ano é bissexto.
# A tabela abaixo contém as datas que formam os perídos de cada signo no calendário. As colunas com nome iniciando com dt_ são datas com dia e mês. As colunas com nome no padrão j_ são os dias no ano. Dessa forma, alguem nascido no dia 50º dia do ano é do signo de Peixes.

sig <-
  data.frame(dt_ini = c("20/mar", "21/abr", "21/mai", "21/jun",
                        "22/jul", "23/ago", "23/set", "23/out",
                        "22/nov", "22/dez", "21/jan", "19/fev"),
             dt_fim = c("20/abr", "20/mai", "20/jun", "21/jul",
                        "22/ago", "22/set", "22/out", "21/nov",
                        "21/dez", "21/jan", "18/fev", "19/mar"),
             signo = c("Áries", "Touro", "Gêmeos", "Câncer", "Leão",
                       "Virgem", "Libra", "Escorpião", "Sagitário",
                       "Capricórnio", "Aquário", "Peixes"),
             j_ini = c(79L, 111L, 141L, 172L, 203L, 235L, 266L, 296L,
                       326L, 356L, 21L, 50L),
             j_fim = c(110L, 140L, 171L, 202L, 234L, 265L, 295L, 325L,
                       355L, 21L, 49L, 78L))

# Verificando o signo dos jogadores
for (i in 1:nrow(tb_play)) {
  
  dia_ano <- tb_play$dia_ano[i]
  signo <- ""
  
  for (j in 1:nrow(sig)) {
    
    if (dia_ano >= sig$j_ini[j] & dia_ano <= sig$j_fim[j]) {
      
      signo <- sig$signo[j]
      
      break
    } 
  }
  
  tb_play$signo[i] <- signo
}

tb_play %>% dplyr::filter(FirstName == "Nejc")
