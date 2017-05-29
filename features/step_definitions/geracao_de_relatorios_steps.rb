Given(/^o sistema possui o departamento de "([^"]*)"cadastrado$/) do |dep_name|
  Department.create(name: dep_name)
  expect(Department.find_by_name(dep_name)).to_not be nil
end

Given(/^o sistema possui o laboratorio de "([^"]*)" cadastrado no departamento de "([^"]*)"$/) do |lab_name, dep_name|
  dep = Department.find_by(name: dep_name)
  expect(dep).to_not be nil
  dep.laboratories.create(name: lab_name)
  expect(Laboratory.find_by(name: lab_name)).to_not be nil
end

Given(/^o sistema possui "([^"]*)"kg de residuos cadastrados no laboratório de "([^"]*)"$/) do |res_weight, lab_name|
  lab = Laboratory.find_by(name: lab_name)
  expect(lab).to_not be nil
  res = lab.residues.create(name: "Acido")
  reg = res.registers.create(weight: res_weight.to_f(),created_at: '23/02/2017'.to_date)
  expect(reg).to_not be nil
  total = res.total
  total.eql?(res_weight)

end


When(/^eu tento produzir o relatório total de resíduos cadastrados entre as datas "([^"]*)" e "([^"]*)" para o departamento de "([^"]*)"$/) do |data_begin, data_final, dep_name|
  residues_total_in_data = 0
  expect(Department.find_by(name: dep_name)).to_not be nil
  Residue.all.each do |it|
    rList = it.registers.where(created_at: [data_begin.to_date..data_final.to_date])
   p rList.first.weight
   residues_total_in_data = residues_total_in_data + (rList.last.weight - rList.first.weight)
  end
  p residues_total_in_data

end

Then(/^o valor retornado pelo sistema será "([^"]*)"kg$/) do |res_weight|
  @print.eql?(res_weight)
 # p @print
end

Given(/^o sistema possui "([^"]*)" kg de residuos cadastrados entre entre as datas "([^"]*)" e "([^"]*)" para o laboratorio de "([^"]*)"$/) do |res_weight, data_begin, data_final, lab_name|
	expect(Laboratory.find_by_name(lab_name)).to_not be nil
	Residue.create(name: "Acido", lab_name: lab_name, weight: res_weight, created_at: data_begin.to_date)
	res = Residue.where(created_at: [data_begin.to_date..data_final.to_date])
  expect(res).to_not be nil
  p res.total.eql?(res_weight)

end

Given(/^o sistema possui o departamento de "([^"]*)" cadastrado com o resíduo "([^"]*)" com quantidade total de "([^"]*)"Kg$/) do |arg1, arg2, arg3|
  dep = Department.create(name: arg1)
  lab = dep.laboratories.create(name: "lab_base: " + arg1)
  res = lab.residues.create(name: arg2)
  reg = res.registers.create(weight: arg3.to_f())
  expect(dep).to_not be nil
  expect(res).to_not be nil
  expect(reg).to_not be nil
  expect(reg.weight).to_not be eq(arg3.to_f())
end

When(/^eu tento gerar um relatório dos resíduos do departamento de "([^"]*)", "([^"]*)" e "([^"]*)"$/) do |arg1, arg2, arg3|
  dep = Department.find_by(name: arg1)
  Residue.all.each do |it|
    p it
  end
  pending # Write code here that turns the phrase above into concrete actions
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

