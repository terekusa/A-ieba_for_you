class RemoveReferencesFromPostDetail < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :post_details, :posts
    remove_reference :post_details, :post, index: true
  end
end
