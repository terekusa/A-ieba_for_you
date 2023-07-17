class AddReferencesToPostDetails < ActiveRecord::Migration[7.0]
  def change
    add_reference :post_details, :post, foreign_key: true
  end
end
