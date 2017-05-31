Given(/^o sistema possui o departamento de "([^"]*)"$/) do |dep_name|
  dep_params = {department: {name: dep_name}}
  post '/departments', dep_params
  dep = Department.find_by(name: dep_name)
  expect(dep).to_not be nil
end

Given(/^o sistema possui o laboratório de "([^"]*)"$/) do |lab_name|
  lab_params = {laboratory: {name: lab_name}}
  post '/laboratories', lab_params
  lab = Laboratory.find_by(name: lab_name)
  expect(lab).to_not be nil
end

Given(/^o sistema possui o resíduo "([^"]*)" cadastrado no laboratorio de "([^"]*)"$/) do |res_name, lab_name|
  lab = Laboratory.find_by(name: lab_name)
  expect(lab).to_not be nil
  res_params = {residue: {name: res_name, laboratory_id: lab.id}}
  post '/residues', res_params
  res = Residue.find_by(name: res_name)
  
  expect(res).to_not be nil
end

Given(/^o peso limitante do sistema é "([^"]*)"kg$/) do |max_weight|
  col = {collection: {max_value: max_weight.to_f()}}
  post '/collections', col
  col = Collection.last
  expect(col).to_not be nil
end

Given(/^o peso de resíduos total é "([^"]*)"kg$/) do |total_weight|
  col = Collection.last
  expect(col).to_not be nil
  
  reg = {register: {weight: total_weight.to_f(), collection_id: col.id}}
  post '/registers', reg
  reg = Collection.last.registers.last
  expect(reg).to_not be nil
end

When(/^o usuário adiciona "([^"]*)"kg do resíduo "([^"]*)" no laboratorio de "([^"]*)"$/) do |res_weight, res_name, lab_name|
  lab = Laboratory.find_by(name: lab_name)
  expect(lab).to_not be nil
  res = Residue.find_by(name: res_name)
  expect(res).to_not be nil
  col = Collection.last
  expect(col).to_not be nil

  
  reg = {register: {weight: res_weight.to_f(), residue_id: res.id, collection_id: col.id}}
  post '/update_weight', reg
  reg = res.registers.last
  expect(reg).to_not be nil
  
end

Then(/^o sistema verifica que o peso total é maior ou igual ao limite mínimo$/) do
  col = Collection.last
  expect(col).to_not be nil
  reg = col.registers.last
  expect(reg).to_not be nil
  
  expect(reg.weight).to be >= col.max_value
end

Then(/^o sistema gera uma notificação de limite máximo atingido$/) do
  post '/generate_notification'
end

Given(/^o peso mínimo para afirmar que está próximo do limitante é de "([^"]*)"kg$/) do |max_close_weight|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^o sistema verifica que o peso total é maior que o limite mínimo para emitir um alerta$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^o sistema gera uma notificação de alerta de peso próximo ao limite máximo para fazer uma licitação$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^que a soma dos pesos dos resíduos cadastrados é "([^"]*)"kg$/) do |total_weight|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^o peso próximo ao limitante do sistema é "([^"]*)"kg$/) do |max_close_weight|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^eu entro no sistema$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^eu vejo uma notificação de alerta que o peso dos resíduos do departamento está se aproximando do peso mínimo para fazer a licitação$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^o limitante do sistema é "([^"]*)"kg$/) do |max_weight|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^eu vejo uma notificação de requisição de que o peso dos resíduos do departamento está igual ou maior que o mínimo para fazer a licitação\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end