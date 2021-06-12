class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :body
      t.integer :likes_count, default: 0 # add default
      t.string :username

      t.timestamps
    end
  end
end
