class CreateUttrances < ActiveRecord::Migration[6.0]
  def change
    create_table :uttrances do |t|
      t.text :message
      t.float :confidence

      t.timestamps
    end
  end
end
