Dado("que eu envio um GET para a API com o cep {string}") do |string|
  goodcep = "07071000"
  @response = HTTParty.get("https://viacep.com.br/ws/#{goodcep}/json")
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
  badcep = "07071A00"
  @response = HTTParty.get("https://viacep.com.br/ws/#{badcep}/json")
end

Então("verifico o statuscode de falha da API") do
  puts "O código de retorno é #{@response.code}"
  expect(@response.code).to eq 400
end
