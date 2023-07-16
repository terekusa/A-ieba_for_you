class CreatePostDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :post_details do |t|
      t.string :detailable_id
      t.string :detailable_type
      t.string :name
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
