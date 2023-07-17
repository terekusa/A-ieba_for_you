class AddGenreIdToPost < ActiveRecord::Migration[7.0]
  def change
    change_table :posts do |t|
      t.belongs_to :genre
      t.belongs_to :partner
      t.belongs_to :situation
    end
  end
end
