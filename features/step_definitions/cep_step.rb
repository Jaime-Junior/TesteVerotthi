Dado("que eu envio um GET para a API com o cep {string}") do |string|
  @response = HTTParty.get("https://viacep.com.br/ws/07071000/json")
end

Quando("recebo a resposta da API") do
  puts @response.body
end

Então("verifico o statuscode de sucesso da API") do
  puts "O código de retorno é #{@response.code}"
  expect(@response.code).to eq 200
end

Então("exibo o código do IBGE") do
  puts "O código do IBGE é #{@response["ibge"]}"
end

Dado("que eu envio um GET com o {string} inválido") do |string|
  @response = HTTParty.get("https://viacep.com.br/ws/07071A00/json")
end

Então("verifico o statuscode de falha da API") do
  puts "O código de retorno é #{@response.code}"
  expect(@response.code).to eq 400
end
