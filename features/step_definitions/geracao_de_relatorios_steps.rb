@value_test = 0

Given(/^o sistema possui o departamento de "([^"]*)" cadastrado$/) do |dep_name|
  dep = {department: {name: dep_name}}
  post '/departments', dep
  dep = Department.find_by(name: dep_name)
  expect(dep).to_not be nil
end

Given(/^o sistema possui o laboratorio de "([^"]*)" cadastrado no departamento de "([^"]*)"$/) do |lab_name, dep_name|
  dep = Department.find_by(name: dep_name)
  expect(dep).to_not be nil
  lab = {laboratory: {name: lab_name, department_id: dep.id}}
  post '/laboratories', lab
  lab = Laboratory.find_by(name: lab_name, department_id: dep.id)
  expect(lab).to_not be nil
 end 

Given(/^o sistema possui "([^"]*)"kg de residuos cadastrados no laboratório de "([^"]*)"$/) do |res_weight, lab_name|
  lab = Laboratory.find_by(name: lab_name)
  expect(lab).to_not be nil
  res = {residue:{name: "Acido", laboratory_id: lab.id}}
  post '/residues', res
  res = Residue.find_by(name: "Acido")
  expect(res).to_not be nil
  data = '23/02/2017'.to_date
  data1 = '22/02/2017'.to_date
  reg = res.registers.last
  reg.created_at =  data1
  reg.save
  reg = {register: {weight: res_weight.to_f(), residue_id: res.id}}
  post '/update_weight', reg
  reg = res.registers.last
  reg.created_at =  data
  reg.save
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

Given(/^o sistema possui o departamento de "([^"]*)" cadastrado com o resíduo "([^"]*)" com quantidade total de "([^"]*)"Kg$/) do |dep_name, res_name, res_total|
  dep = {department: {name: dep_name}}
  post '/departments', dep
  dep = Department.find_by(name: dep_name)
  expect(dep).to_not be nil
  
  lab = {laboratory: {name: "lab_base: " + dep_name, department_id: dep.id}}
  post '/laboratories', lab
  lab = Laboratory.find_by(name: "lab_base: " + dep_name, department_id: dep.id)
  expect(lab).to_not be nil
  
  res = {residue: {name: res_name, laboratory_id: lab.id}}
  post '/residues', res
  res = Residue.find_by(name: res_name, laboratory_id: lab.id)
  expect(res).to_not be nil
  
  reg = {register: {weight: res_total, residue_id: res.id, departement_id: dep.id, laboratory_id: lab.id}}
  post '/update_weight', reg
  reg = res.registers.last
  expect(reg.weight).to eq(res_total.to_f())
end

When(/^eu tento gerar um relatório dos resíduos dos departamentos de "([^"]*)", "([^"]*)" e "([^"]*)"$/) do |arg1, arg2, arg3|
  rep = {report: {generate_for: 1, begin_date: "01/01/2001".to_date, end_date: "29/12/2029".to_date, f_unit: false, f_state: false, f_kind: false, f_onu: false, f_blend: false, f_code: false, f_total: true}}
  post '/reports', rep
  repc = {reportcell: {dep_name: arg1}}
  post '/generate_reportcell', repc
  repc = {reportcell: {dep_name: arg2}}
  post '/generate_reportcell', repc
  repc = {reportcell: {dep_name: arg3}}
  post '/generate_reportcell', repc
end

Then(/^o sistema retorna o valor de "([^"]*)"Kg para o resíduo "([^"]*)"$/) do |arg1, arg2|
  repc = Reportcell.where(res_name: arg2)
  total = 0
  repc.each do |it|
    total += it.total
  end
  expect(total).to eq(arg1.to_f())
end

Given(/^o resíduo "([^"]*)" possui tipo como "([^"]*)", peso como "([^"]*)"Kg e código ONU como "([^"]*)" no laboratorio de "([^"]*)"$/) do |arg1, arg2, arg3, arg4, arg5|
  lab = Laboratory.find_by(name: arg5)
  expect(lab).to_not be nil
  res = {residue: {name: arg1, kind: arg2, onu: arg4, laboratory_id: lab.id}}
  post '/residues', res
  res = Residue.find_by(name: arg1, laboratory_id: lab.id)
  expect(res).to_not be nil
  reg = {register: {weight: arg3, residue_id: res.id, department_id: lab.department_id, laboratory_id: lab.id}}
  post '/update_weight', reg
  reg = res.registers.last
  expect(reg.weight).to eq(arg3.to_f())
end

When(/^eu tento produzir um relatório dos resíduos do laboratório de "([^"]*)", com os filtros tipo e peso\.$/) do |arg1|
  rep = {report: {generate_for: 2, begin_date: "01/01/2001".to_date, end_date: "29/12/2029".to_date, f_unit: false, f_state: false, f_kind: true, f_onu: false, f_blend: false, f_code: false, f_total: true}}
  post '/reports', rep
  repc = {reportcell: {lab_name: arg1}}
  post '/generate_reportcell', repc
end

Then(/^o sistema retorna as informações "([^"]*)" e "([^"]*)"Kg para o resíduo "([^"]*)"$/) do |arg1, arg2, arg3|
  repc = Reportcell.where(res_name: arg3)
  total = 0
  repc.each do |it|
    total += it.total
  end
  expect(total).to eq(arg2.to_f())
  expect(repc[0].kind).to eq (arg1)
end

