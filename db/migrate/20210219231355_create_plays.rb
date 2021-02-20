class CreatePlays < ActiveRecord::Migration[6.1]
  def change
    create_table :plays do |t|
      t.belongs_to :group
      t.timestamps
    end
  end
end
