-- Primeiramente, é importante que os padrões coincidam com o tipo da entrada. Se a entrada é inteira, por exemplo, "3.14" não é um padrão que funcionará.

adivinheUmNumero :: Int -> String
adivinheUmNumero 0 = "Aeeeee! 0!"
adivinheUmNumero 73 = "Aeeeee! 73!"
adivinheUmNumero 5 = "Aeeeee! 5!"
adivinheUmNumero 83274 = "Aeeeee! 83274"

-- Na função acima, um inteiro é recebido como entrada e comparado com cada um dos padrões, em ordem, de cima para baixo. Caso coincida com um deles, uma string é retornada e todos os padrões abaixo dele são ignorados, pondo um fim nas comparações.  

-- No entanto, caso os padrões da função não cubram todas as possibilidades de padrões, temos um erro. Nesse caso em particular, uma solução é usar "_" como um dos padrões, que funciona como um 'else' ou 'otherwise'.

adivinheUmNumero :: Int -> String
adivinheUmNumero 0 = "Aeeeee! 0!"
adivinheUmNumero 73 = "Aeeeee! 73!"
adivinheUmNumero 5 = "Aeeeee! 5!"
adivinheUmNumero 83274 = "Aeeeee! 83274"
adivinheUmNumero _ = "Xiiee, errou :'("   

-- É importante ter cuidado na utilização de "_" pois, como dito acima, a ordem dos padrões importa. Se for o primeiro dos padrões, por exemplo, a função vai cair nele independente da entrada. Na prática, é isso que ele significa "Independente da entrada, se chegou aqui, é isso". Executando a função abaixo para qualquer inteiro, a saída sempre será a mesma.

-- Em alguns casos, temos até um warning informando que aquelas linhas de código após o primeiro padrão serão "redundantes" o que de fato faz sentido, já que independente delas, acontecerá o mesmo. 

adivinheUmNumero :: Int -> String
adivinheUmNumero _ = "Xiiee, errou :'("   
adivinheUmNumero 0 = "Aeeeee! 0!"
adivinheUmNumero 73 = "Aeeeee! 73!"
adivinheUmNumero 5 = "Aeeeee! 5!"
adivinheUmNumero 83274 = "Aeeeee! 83274"


