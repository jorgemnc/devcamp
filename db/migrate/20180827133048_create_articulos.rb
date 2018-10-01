class CreateArticulos < ActiveRecord::Migration[5.2]
  def change
    create_table :articulos do |t|
      t.string :titulo
      t.text :cuerpo

      t.timestamps
    end
  end
end
