class CreateFaceapis < ActiveRecord::Migration[6.0]
  def up
    create_table :faceapis do |t|
      t.string :message
      t.string :idd
      t.boolean :pheduyet

      t.timestamps
    end
  end
  def down

  end
end