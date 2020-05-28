Dado("que eu envio um GET para a API com o cep {string}") do |cepvalido|
  @response = HTTParty.get("https://viacep.com.br/ws/#{cepvalido}/json")
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

Dado("que eu envio um GET com o {string} inválido") do |cepinvalido|
  @response = HTTParty.get("https://viacep.com.br/ws/#{cepinvalido}/json")
end

Então("verifico o statuscode de falha da API") do
  puts "O código de retorno é #{@response.code}"
  expect(@response.code).to eq 400
end
