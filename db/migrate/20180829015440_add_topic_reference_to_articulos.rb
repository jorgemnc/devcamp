class AddTopicReferenceToArticulos < ActiveRecord::Migration[5.2]
  def change
    add_reference :articulos, :topic, foreign_key: true
  end
end
