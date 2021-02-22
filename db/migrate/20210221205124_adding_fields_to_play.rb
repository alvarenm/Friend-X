class AddingFieldsToPlay < ActiveRecord::Migration[6.1]
  def change
    add_column :plays, :sorted_players, :string, array: true
  end
end
