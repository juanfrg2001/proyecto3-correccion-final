class AddUserReferencesToCalories < ActiveRecord::Migration[6.1]
  def change
    add_reference :calories, :user, null: false, foreign_key: true
  end
end
