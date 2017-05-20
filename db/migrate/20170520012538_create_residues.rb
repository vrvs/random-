class CreateResidues < ActiveRecord::Migration[5.0]
  def change
    create_table :residues do |t|
      t.string :name
      t.string :string
      t.string :lab_name
      t.string :string
      t.string :weight
      t.string :integer
      t.string :type
      t.string :string

      t.timestamps
    end
  end
end
