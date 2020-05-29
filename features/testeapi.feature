# force_encoding("UTF-8")
# force_encoding(Encoding::UTF_8)
#language:pt

Funcionalidade: Requisição da API
    Como o usuário faz requsição à API

@goodcep
Cenário: CEP válido
    Dado que eu envio um GET para a API com o cep "07071000"
    Quando recebo a resposta da API
    Então verifico o statuscode de sucesso da API
    E exibo o código do IBGE

@badcep
Esquema do Cenário: CEP inválido
    Dado que eu envio um GET com o "<cep>" inválido
    Quando recebo a resposta da API
    Então verifico o statuscode de falha da API "<tipo_erro>"

    Exemplos:
    | cep        | tipo_erro    |
    | 07071A00   | alfanumerico |
    | 070710000  | carac_extra  |
    | 99999999   | invalido     |
    | 07071%2000 | espaco       |