<<<<<<< HEAD
json.extract! laboratory, :id, :name, :string, :dep_name, :string, :facilitador, :string, :created_at, :updated_at
=======
json.extract! laboratory, :id, :name, :department_id, :user_id, :created_at, :updated_at
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
json.url laboratory_url(laboratory, format: :json)
