class CreateWeights < ActiveRecord::Migration[6.1]
  def change
    create_table :weights do |t|
      t.integer :weight
      t.date :date_weight
      t.integer :years_old
      t.integer :height
      t.string :sex
      t.string :description_weight

      t.timestamps
    end
  end
end
