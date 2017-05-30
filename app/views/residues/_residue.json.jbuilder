<<<<<<< HEAD
json.extract! residue, :id, :name, :string, :lab_name, :string, :weight, :integer, :type, :string, :created_at, :updated_at
=======
json.extract! residue, :id, :name, :type, :blend, :onu, :code, :laboratory_id, :created_at, :updated_at
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
json.url residue_url(residue, format: :json)
