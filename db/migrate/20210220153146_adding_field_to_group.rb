class AddingFieldToGroup < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :creator_email, :string 
  end
end
