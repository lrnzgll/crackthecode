class CreateAttempt < ActiveRecord::Migration[7.0]
  def change
    create_table :attempts do |t|
      t.string :number, null: false
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
