class RemoveColumnFromCalory < ActiveRecord::Migration[6.1]
  def change
    remove_column :calories, :type_calory, :integer
  end
end
