class AddTypeToCalories < ActiveRecord::Migration[6.1]
  def change
    add_column :calories, :type, :integer
  end
end
