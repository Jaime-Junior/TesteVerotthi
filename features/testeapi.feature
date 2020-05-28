#language:pt

Funcionalidade: Requisição da API
    Como o usuário faz requsição à API

@goodcep
Cenario: Requisição CEP
    Dado que eu envio um GET para a API com o cep "CEP"
    Quando recebo a resposta da API
    Então verifico o statuscode de sucesso da API
    E exibo o código do IBGE

@badcep
Cenario: CEP inválido
    Dado que eu envio um GET com o "CEP" inválido
    Quando recebo a resposta da API
    Então verifico o statuscode de falha da API
    E exibo os valores armazenados