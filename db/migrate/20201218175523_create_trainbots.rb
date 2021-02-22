class CreateTrainbots < ActiveRecord::Migration[6.0]
  def change
    create_table :trainbots do |t|
      t.text :message
      t.string :intent
      t.string :entity
      t.string :start
      t.string :end
      t.string :body

      t.timestamps
    end
  end
end
