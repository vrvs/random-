Given(/^o sistema possui o departamento de "([^"]*)"cadastrado$/) do |dep_name|
  dept = Department.create(name: dep_name)
  lab = dept.laboratories.create(name: "Química Aplicada")
  res = lab.residues.create(name: "Ácido Cloridrico")
  
  p dept
  p lab
  p res
  
  dept.destroy
  
  p Residue.find_by_name("Ácido Cloridrico")
  p "test"
  
  #expect(Department.find_by_name(dep_name)).to_not be nil
end

Given(/^o sistema possui o laboratorio de "([^"]*)" cadastrado no departamento de "([^"]*)"$/) do |lab_name, dep_name|
  dept = Department.find_by_name(dep_name)
  expect(dept).to_not be nil
  lab = Laboratory.create(name: lab_name)
  lab.department_id = dept.id
  lab.save
  p Department.find_by_id(Laboratory.find_by_name(lab_name).department_id)
  expect(Laboratory.find_by_name(lab_name)).to_not be nil
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