class AddTypeToPostDetail < ActiveRecord::Migration[7.0]
  def change
    add_column :post_details, :type, :string
  end
end
