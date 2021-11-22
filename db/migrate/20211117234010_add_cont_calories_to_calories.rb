class AddContCaloriesToCalories < ActiveRecord::Migration[6.1]
  def change
    add_column :calories, :cont_calories, :integer
  end
end
