@collection = []
Given(/^existe "([^"]*)"kg de residuos cadastrados no sistema$/) do |res_weight|
 
 col = Collection.create()
 dept = Department.create(name: "Departamento de Genetica")
 lab = dept.laboratories.create(name: "Laboratorio de Genetica Aplicada")
 res = lab.residues.create(name: "Etanol")
 reg = res.registers.create(weight: res_weight)
 res.collection_id = col.id
 res.save
 col.registers.create(weight: res_weight.to_f())
 #total = 0
 #collection.residue.each do |it|
 # tal = total + it.registers.last.weight
 #end
 #p total 
 expect(Department.find_by_name("Departamento de Genetica")).to_not be nil
end
 
Given(/^a última coleta foi feita a  "([^"]*)" dias$/) do |last_collection|
 @collection = Collection.all
 @collection[0].create_at -= 10
end
 
Given(/^o limite de peso de resíduos é  "([^"]*)"$/) do |limit_weight|
 @collection = Collection.all
 @collection[0].max_value=limit_weight
end
 
When(/^eu tento gerar a  "([^"]*)"$/) do |action|
  if action == "Previsão de Notificação de Coleta"
      #Chama a rota ganerate_prediction_url que chama o controlador Collection e #action generate_prediction
      post generate_prediction_url
  end
end
 
Then(/^o sistema calcula a média de  "([^"]*)"$/) do |mean|
 assert f_mean == mean.to_f()
end
 
Then(/^o sistema calcula que faltam  "([^"]*)" kg para atingir o limite$/) do |miss_weight|
  assert miss_weight.to_f() == f_miss
end
 
Then(/^o sistema calcula que faltam  "([^"]*)" para fazer a licitação$/) do |miss_days|
 miss = f_miss/f_mean
 assert miss_days.to_i()==miss
end
 
def f_mean
 @collection = Collection.all
 weight = @collection[0].total_weight
 time = @collection[0].last_collection
 test = weight/time
 return test
end
 
def f_miss
 @collection = Collection.all
 weight = @collection[0].total_weight
 miss = @collection[0].limit_weight - weight
 return miss
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