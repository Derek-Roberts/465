class CreateImageUsersJoin < ActiveRecord::Migration
  def change
    create_table :image_users, :id => false do |t|
      t.integer "image_id"
      t.integer "user_id"
    end
    add_index :image_users, ["image_id", "user_id"]
  end
end
