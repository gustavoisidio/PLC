-- Exemplo de uma biblioteca tirado dos slides

type Pessoa = String
type Livro = String
type BancoDados = [ ( Pessoa, Livro ) ]

baseExemplo :: BancoDados
baseExemplo =
    [("Sergio","O Senhor dos Aneis"),
     ("Andre","Duna"),
     ("Fernando","Jonathan Strange & Mr.Norrell"),
     ("Fernando","Duna")]

livros :: BancoDados -> Pessoa -> [ Livro ]
livros [  ] _ = [  ]
livros ( ( a, b ):abs ) pessoa
  | pessoa == a = b : ( livros abs pessoa )
  | otherwise = livros abs pessoa

emprestimos :: BancoDados -> Livro -> [ Pessoa ]
emprestimos [  ] _ = [  ]
emprestimos ( ( a, b ):abs ) livro
    | livro == b = a : ( emprestimos abs livro )
    | otherwise = emprestimos abs livro

emprestado :: BancoDados -> Livro -> Bool
emprestado [  ] _ = False
emprestado ( ( a, b ):abs ) livro
    | livro == b = True
    | otherwise = emprestado abs livro    

qtdEmprestimos :: BancoDados -> Pessoa -> Int
qtdEmprestimos [  ] _ = 0
qtdEmprestimos ( ( a, b ):abs ) pessoa
    | a == pessoa = 1 + ( qtdEmprestimos abs pessoa )
    | otherwise = ( qtdEmprestimos abs pessoa )

emprestar :: BancoDados -> Pessoa -> Livro -> BancoDados
emprestar banco pessoa livro = ( pessoa, livro ) : banco

devolver :: BancoDados -> Pessoa -> Livro -> BancoDados
devolver [  ] _ _ = [  ]
devolver ( ( a, b ):abs ) pessoa livro
    | a == pessoa && b == livro = devolver abs pessoa livro
    | otherwise = ( a, b ) : ( devolver abs pessoa livro)












