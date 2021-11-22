class AddContRegisterToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :cont_register, :integer
  end
end
