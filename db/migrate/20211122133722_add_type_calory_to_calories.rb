class AddTypeCaloryToCalories < ActiveRecord::Migration[6.1]
  def change
    add_column :calories, :type_calory, :string
  end
end
