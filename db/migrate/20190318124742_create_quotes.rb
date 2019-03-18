class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :character
      t.text :quote
      t.integer :episode

      t.timestamps
    end
  end
end
