class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.references :notifiable, polymorphic: true
      t.integer :action_type, null: false
      t.boolean :check, null: false, default: false

      t.timestamps
    end
  end
end
