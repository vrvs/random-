@value_test = 0
Given(/^o sistema possui o departamento de "([^"]*)"cadastrado$/) do |dep_name|
  dep = {department:{name: dep_name}}
  post '/departments', dep
  
  expect(dep).to_not be nil
end

Given(/^o sistema possui o laboratorio de "([^"]*)" cadastrado no departamento de "([^"]*)"$/) do |lab_name, dep_name|
  dep = Department.find_by(name: dep_name)
  expect(dep).to_not be nil
  lab = {laboratory:{name: lab_name, department_id: lab.id}}
  post '/laboratories', lab
  expect(lab).to_not be 
  
end

Given(/^o sistema possui "([^"]*)"kg de residuos cadastrados no laboratório de "([^"]*)"$/) do |res_weight, lab_name|
  lab = Laboratory.find_by(name: lab_name)
  expect(lab).to_not be nil
  res = {residue:{name: "Acido", laboratory_id: lab.id}}
  post '/residues', res
  expect(res).to_not be nil
  reg = {register: {weight: res_weight.to_f(), created_at: '23/02/2017'.to_date}}
  post 'update_weight', reg
  expect(reg).to_not be nil
  total = res.total
  expect(total).to eq(res_weight.to_f())
end


When(/^eu tento produzir o relatório total de resíduos cadastrados entre as datas "([^"]*)" e "([^"]*)" para o departamento de "([^"]*)"$/) do |data_begin, data_final, dep_name|
  residues_total_in_data = 0
  expect(Department.find_by(name: dep_name)).to_not be nil

Residue.all.each do |it|
  rList = it.registers.where(created_at: [data_begin.to_date..data_final.to_date])
  expect(rList).to_not be nil
   residues_total_in_data = residues_total_in_data + (rList.last.weight - rList.first.weight)
  end
  @value_test = residues_total_in_data

end

Then(/^o valor retornado pelo sistema será "([^"]*)"kg$/) do |res_weight|
  expect(@value_test).to eq(res_weight.to_f())
end

Given(/^o sistema possui "([^"]*)" kg de residuos cadastrados entre entre as datas "([^"]*)" e "([^"]*)" para o laboratorio de "([^"]*)"$/) do |res_weight, data_begin, data_final, lab_name|
  lab = Laboratory.find_by(name: lab_name)
	expect(lab).to_not be nil
	res = {residue: {name:"Acido", laboratory_id: lab.id}}
	post '/residues', res
	expect(res).to_not be nil
	reg = res.registers.create(weight: 0, created_at: '20/02/2017'.to_date)
	reg = res.registers.create(weight: res_weight, created_at: data_begin.to_date)
	res = Residue.where(created_at: [data_begin.to_date..data_final.to_date])
  expect(res).to_not be nil
  p res.total.eql?(res_weight)

end
#######################################################FIM RODRIGO######################################################################################################################################
Given(/^o sistema possui o departamento de "([^"]*)" cadastrado com o resíduo "([^"]*)" com quantidade total de "([^"]*)"Kg$/) do |arg1, arg2, arg3|
  col = {collection: {max_value: 7500.0}}
  post '/collections', col
  col = Collection.last
  expect(col).to_not be nil
  
  dep = {department: {name: arg1}}
  post '/departments', dep
  dep = Department.find_by(name: arg1)
  expect(dep).to_not be nil
  
  lab = {laboratory: {name: "lab_base: " + arg1, department_id: dep.id}}
  post '/laboratories', lab
  lab = Laboratory.find_by(name: "lab_base: " + arg1)
  expect(lab).to_not be nil
  
  res = {residue: {name: arg2, collection_id: col.id, laboratory_id: lab.id}}
  post '/residues', res
  res = Residue.find_by(name: arg2)
  expect(res).to_not be nil
  
  reg = {register: {weight: arg3, residue_id: res.id}}
  post '/update_weight', reg
  reg = res.registers.last

  expect(dep).to_not be nil
  expect(res).to_not be nil
  expect(reg).to_not be nil
end

When(/^eu tento gerar um relatório dos resíduos do departamento de "([^"]*)", "([^"]*)" e "([^"]*)"$/) do |arg1, arg2, arg3|
  
end

Then(/^o sistema retorna o valor de "([^"]*)"Kg para o resíduo "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^o sistema  possui o laboratório de "([^"]*)" cadastrado com o resíduo "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^o resíduo "([^"]*)" possui tipo como "([^"]*)", peso como "([^"]*)"Kg e código ONU como "([^"]*)"$/) do |arg1, arg2, arg3, arg4|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^eu tento produzir um relatório dos resíduos do laboratório de "([^"]*)", com os filtros tipo e peso\.$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^o sistema retorna as informações "([^"]*)" e "([^"]*)"Kg\.$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end
