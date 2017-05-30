class CreateRegisters < ActiveRecord::Migration[5.0]
  def change
    create_table :registers do |t|
      t.float :weight
      t.belongs_to :department, index: true, foreign_key: true
      t.belongs_to :laboratory, index: true, foreign_key: true
      t.belongs_to :residue, index: true, foreign_key: true
      t.belongs_to :collection, index: true, foreign_key: true
      t.belongs_to :report, index: true, foreign_key: true

      t.timestamps
    end
    change_column :registers, :weight, :float, default: 0
  end
end
