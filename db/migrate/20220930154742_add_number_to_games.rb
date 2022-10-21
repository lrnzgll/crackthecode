class AddNumberToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :number, :string, null: false
  end
end
