json.extract! user, :id, :name, :last_name, :email, :password, :birthday, :gender, :place, :number, :cep, :district, :city, :state, :country, :phone, :cell_phone, :type, :created_at, :updated_at
json.url user_url(user, format: :json)
