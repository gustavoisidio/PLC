logSetembro = "2016-09-27;19:31:52;Normal;208772;\n2016-09-27;18:12:02;Normal;155759;\n2016-09-26;17:12:02;Normal;155759;\n2016-09-26;16:11:02;Denied;188758;\n2016-09-25;19:12:02;Normal;155759;" :: String

tiposDeAcesso :: String -> (Int, Int) 
tiposDeAcesso str = (length (filter (=='N') str), length (filter (== 'D') str))