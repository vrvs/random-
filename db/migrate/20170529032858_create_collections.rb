class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.float :max_value
      t.text :report
      t.float :mean
      t.float :miss_weight
      t.integer :miss_days
      t.timestamps
    end
  end
end
