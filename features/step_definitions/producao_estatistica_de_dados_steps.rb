@collection = []
Given(/^existe "([^"]*)" kg de residuos cadastrados no sistema$/) do |res_weight|
 col = {collection: {max_value: 0}}
 post '/collections', col
 col = Collection.find_by(max_value: 0)
 expect(col).to_not be nil
 dep = {department: {name: "Departamento de Genetica"}}
 post '/departments', dep
 dep = Department.find_by(name: "Departamento de Genetica")
 expect(dep).to_not be nil
 lab = {laboratory: {name: "Laboratorio de Genetica Aplicada", department_id: dep.id}}
 post '/laboratories', lab
 lab = Laboratory.find_by(name: "Laboratorio de Genetica Aplicada")
 expect(lab).to_not be nil
 res = {residue: {name: "Etanol", laboratory_id: lab.id}}
 post '/residues', res
 res = Residue.find_by(name: "Etanol")
 expect(res).to_not be nil
 reg = {register: {weight: res_weight.to_f(), residue_id: res.id}}
 post '/registers', reg
 res.collection_id = col.id
 res.save
 expect(reg).to_not be nil
 col.registers.create(weight: res_weight.to_f())
 expect(Department.find_by_name("Departamento de Genetica")).to_not be nil
end
 
Given(/^a ultima coleta foi feita a "([^"]*)" dias$/) do |last_collection|
 @collection = Collection.last
 @collection.created_at= (@collection.created_at.to_date - 10)
 @collection.save
end
 
Given(/^o limite de peso de residuos é "([^"]*)" kg$/) do |limit_weight|
 @collection = Collection.last
 @collection.max_value=limit_weight
 @collection.save
end

When(/^eu tento gerar a "([^"]*)"$/) do |action|
  if action == "Previsão de Notificação de Coleta"
      #Chama a rota ganerate_prediction_url que chama o controlador Collection e #action generate_prediction
      post '/generate_prediction_url'
  end
end
 
Then(/^o sistema calcula a média de "([^"]*)" kg\/dia$/) do |mean|
 @collection = Collection.last
 expect(@collection.mean).to eq(mean.to_f())
end
 
Then(/^o sistema calcula que faltam "([^"]*)" kg para atingir o limite$/) do |miss_weight|
  expect(miss_weight.to_f()).to eq(@collection.miss_weight)
end
 
Then(/^o sistema calcula que faltam "([^"]*)" dias para fazer a licitação$/) do |miss_days|
 expect(miss_days.to_i()).to eq(@collection.miss_days)
end

 
def cad_col(col_name)
 param_col = {collection: {name: col_name}}
 post '/collections', param_col
 assert !Collection.where(name: col_name).empty?
end
 
def cad_dep(dep_name)
 param_dep = {departament: {name: dep_name}}
 post '/departaments', param_dep
 assert !Department.where(name: dep_name).empty?
end
 
def cad_lab(lab_name, dep_name, fac_name)
 param_lab = {laboratory: {name: lab_name, department: dep_name, facilitator: fac_name}}
 post '/laboratories', param_lab
 assert !Laboratory.where(name: lab_name).empty?
end
 
def cad_res(res_name, lab_name, res_weight, res_type,col_name)
 param_res = {residue: {name: res_name, laboratory: lab_name, weight: res_weight, type: res_type, collection: col_name}}
 post '/residues', param_res
 assert !Residue.where(name: res_name).empty?
 assert !Residue.where(name: res_weight).empty?
end

Given(/^existe "([^"]*)" kg de "([^"]*)" de tipo "([^"]*)" cadastrado no sistema$/) do |res_weight, res_name, res_type|
 
  cad_col("UFPE")
  cad_dep("Departamento de Genetica")
  cad_lab("Laboratorio de Genetica Aplicada","Departamento de Genetica","Jose de Abreu")
  cad_res(res_name,"Laboratorio de Genetica Aplicada",res_weight.to_f(),res_type,"UFPE")
 
end
 
When(/^eu tento gerar o "([^"]*)"$/) do |action|
 if action == "Total de Resíduos Acumulados por Tipo"
     #Chama a rota type_residue_url que chama o controlador Collection e #action type_residue
     post type_residue_url
 end
end
 
Then(/^o sistema calcula o  "([^"]*)" com "([^"]*)" de substâncias do tipo "([^"]*)" e "([^"]*)" de substâncias do tipo "([^"]*)"$/) do |action,res_weight1,res_type1,res_weight2,res_type2|
  assert res_weight1.to_f() == Collection.total_type_residue(res_type1)
  assert res_weight2.to_f() == Collection.total_type_residue(res_type2)
end