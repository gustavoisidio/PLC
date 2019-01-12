type DicionarioT = Tree Int Stringdata Tree chave valor = Node chave valor (Tree chave valor) (Tree chave valor)
                                                        | Leaf

meuDicionarioT :: DicionarioT