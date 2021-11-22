class AddDescriptionCaloryToCalories < ActiveRecord::Migration[6.1]
  def change
    add_column :calories, :description_calory, :string
  end
end
