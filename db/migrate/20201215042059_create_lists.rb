class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :keyword
      t.string :synonyms
      t.string :entities

      t.timestamps
    end
  end
end
