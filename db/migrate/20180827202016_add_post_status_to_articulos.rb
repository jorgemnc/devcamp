class AddPostStatusToArticulos < ActiveRecord::Migration[5.2]
  def change
    add_column :articulos, :status, :integer, default:0
  end
end
