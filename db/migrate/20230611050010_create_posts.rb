class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :word, null: false
      t.string :image
      t.text :episode
      t.text :partners_word, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
