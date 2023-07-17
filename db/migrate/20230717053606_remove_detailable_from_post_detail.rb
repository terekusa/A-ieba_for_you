class RemoveDetailableFromPostDetail < ActiveRecord::Migration[7.0]
  def change
    remove_column :post_details, :detailable_type, :string
    remove_column :post_details, :detailable_id, :string
  end
end
