class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.integer :generate_by
      t.date :begin_date
      t.date :end_date
      t.boolean :f_unit
      t.boolean :f_state
      t.boolean :f_kind
      t.boolean :f_onu
      t.boolean :f_blend
      t.boolean :f_code
      t.boolean :f_total
      t.belongs_to :collection, index: true, foreign_key: true

      t.timestamps
    end
  end
end
