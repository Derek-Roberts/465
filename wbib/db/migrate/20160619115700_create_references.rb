class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.text :url
      t.string :topic
      t.string :annotation
      t.datetime :created_at

      t.timestamps
    end
  end
end
