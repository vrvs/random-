class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.float :max_value
      t.text :report
      t.float :mean
      t.float :miss_weight
      t.integer :miss_days
      t.float :solido_organico
      t.float :solido_inorganico
      t.float :liquido_organico
      t.float :liquido_inorganico
      t.float :liquido_inflamavel
      t.float :outros
      t.timestamps
    end
  end
end
