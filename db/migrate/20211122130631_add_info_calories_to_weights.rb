class AddInfoCaloriesToWeights < ActiveRecord::Migration[6.1]
  def change
    add_column :weights, :info_calories, :integer
  end
end
