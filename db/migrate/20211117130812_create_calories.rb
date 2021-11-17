class CreateCalories < ActiveRecord::Migration[6.1]
  def change
    create_table :calories do |t|
      t.integer :type_calory
      t.string :comment_calory
      t.date :date_calory

      t.timestamps
    end
  end
end
