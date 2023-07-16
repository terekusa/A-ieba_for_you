class RemoveDetailableIdFromPost < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :genre_id, :integer
    remove_column :posts, :partner_id, :integer
    remove_column :posts, :situation_id, :integer
  end
end
