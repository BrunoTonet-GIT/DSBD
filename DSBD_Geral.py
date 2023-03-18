# Famoso primeiro teste de programação:

print("Hello, Sr. World!")



# Comparação entre dois número:

N1 = float(input("Primeiro número: "))
N2 = float(input("Segundo número: "))

if (N1 > N2):
  print("Resultado: {} é maior que {}".format(N1, N2))
elif (N1 < N2):
  print("Resultado: {} é menor que {}".format(N1, N2))
else:
  print("Resultado: São iguais, bobão!")



# Exercício Aula 2 (95)

## Variáveis Base:

Ingresso_Base = int(10)
Comprar = input("Gostaria de comprar um ingresso (0/1)? ")

## Loop

while (True):

  if (Comprar == "1"):

    Idade = int(input("Qual a idade do comprador? "))

    if (Idade < 5 or Idade > 70):
      Ingresso_C1 = int(0)
      print("Ingresso: Livre (Idade: {} anos/R$: {} reais)".format(Idade, Ingresso_C1))
      Comprar = input("Gostaria de comprar mais um ingresso (0/1)? ")

    elif (Idade >= 5 and Idade <= 12):
      Ingresso_C2 = int(Ingresso_Base/2)
      print("Ingresso: Meia (Idade: {} anos/R$: {} reais)".format(Idade, Ingresso_C2))
      Comprar = input("Gostaria de comprar mais um ingresso (0/1)? ")

    elif (Idade >= 13 and Idade <= 17):
      Ingresso_C3 = int(Ingresso_Base*0.2)
      print("Ingresso: Desconto (Idade: {} anos/R$: {} reais)".format(Idade, Ingresso_C3))
      Comprar = input("Gostaria de comprar mais um ingresso (0/1)? ")

    elif (Idade >= 18 and Idade <= 70):
      Ingresso_C4 = int(Ingresso_Base*1.0)
      print("Ingresso: Integral (Idade: {} anos/R$: {} reais)".format(Idade, Ingresso_C4))
      Comprar = input("Gostaria de comprar mais um ingresso (0/1)? ")

  else:

    break

print("Obrigado, volte sempre")


