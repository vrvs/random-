class CreateLaboratories < ActiveRecord::Migration[5.0]
  def change
    create_table :laboratories do |t|
      t.string :name
      t.string :string
      t.string :dep_name
      t.string :string
      t.string :facilitador
      t.string :string

      t.timestamps
    end
  end
end
