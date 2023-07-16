class AddDetailableIdToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :genre_id, :integer
    add_column :posts, :partner_id, :integer
    add_column :posts, :situation_id, :integer
  end
end
