Given(/^o sistema possui o departamento de "([^"]*)"cadastrado$/) do |dep_name|
  Department.create(name: dep_name)
  expect(Department.find_by_name(dep_name)).to_not be nil
end

Given(/^o sistema possui o laboratorio de "([^"]*)" cadastrado no departamento de "([^"]*)"$/) do |arg1, arg2|
  dep = {department: {name: arg2}}
  post '/departments', dep
  dep = Department.find_by(name: arg2)
  expect(dep).to_not be nil
  
  lab = {laboratory: {name: arg1, department_id: dep.id}}
  post '/laboratories', lab
  lab = Laboratory.find_by(name: arg1, department_id: dep.id)
  expect(lab).to_not be nil
end

Given(/^o sistema possui "([^"]*)"kg de residuos cadastrados no laboratório de "([^"]*)"$/) do |res_weight, lab_name|
  expect(Laboratory.find_by_name(lab_name)).to_not be nil
  Residue.create(name: "Acido", lab_name: lab_name, weight: res_weight, created_at: '23/02/2017'.to_date)
  r = Residue.where(lab_name: lab_name)
  r.total.eql?(res_weight)
end

@print = 0
When(/^eu tento produzir o relatório total de resíduos cadastrados entre as datas "([^"]*)" e "([^"]*)" para o departamento de "([^"]*)"$/) do |data_begin, data_final, dep_name|
  expect(Department.find_by_name(dep_name)).to_not be nil
  residues_total_in_data = Residue.where(created_at: [data_begin.to_date..data_final.to_date])
  @print = residues_total_in_data.total

end

Then(/^o valor retornado pelo sistema será "([^"]*)"kg$/) do |res_weight|
  @print.eql?(res_weight)
  p @print
end

Given(/^o sistema possui "([^"]*)" kg de residuos cadastrados entre entre as datas "([^"]*)" e "([^"]*)" para o laboratorio de "([^"]*)"$/) do |res_weight, data_begin, data_final, lab_name|
	expect(Laboratory.find_by_name(lab_name)).to_not be nil
	Residue.create(name: "Acido", lab_name: lab_name, weight: res_weight, created_at: data_begin.to_date)
	res = Residue.where(created_at: [data_begin.to_date..data_final.to_date])
  expect(res).to_not be nil
  p res.total.eql?(res_weight)
end

Given(/^o sistema possui o departamento de "([^"]*)" cadastrado com o resíduo "([^"]*)" com quantidade total de "([^"]*)"Kg$/) do |arg1, arg2, arg3|
  dep = {department: {name: arg1}}
  post '/departments', dep
  dep = Department.find_by(name: arg1)
  expect(dep).to_not be nil
  
  lab = {laboratory: {name: "lab_base: " + arg1, department_id: dep.id}}
  post '/laboratories', lab
  lab = Laboratory.find_by(name: "lab_base: " + arg1, department_id: dep.id)
  expect(lab).to_not be nil
  
  res = {residue: {name: arg2, laboratory_id: lab.id}}
  post '/residues', res
  res = Residue.find_by(name: arg2, laboratory_id: lab.id)
  expect(res).to_not be nil
  
  reg = {register: {weight: arg3, residue_id: res.id, departement_id: dep.id, laboratory_id: lab.id}}
  post '/update_weight', reg
  reg = res.registers.last
  expect(reg.weight).to eq(arg3.to_f())
end

When(/^eu tento gerar um relatório dos resíduos do departamento de "([^"]*)", "([^"]*)" e "([^"]*)"$/) do |arg1, arg2, arg3|
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
