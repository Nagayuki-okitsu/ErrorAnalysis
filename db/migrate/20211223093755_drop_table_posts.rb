class DropTablePosts < ActiveRecord::Migration[6.1]
  def change
    drop_table :posts do |t|
      t.bigint "user_id"
      t.timestamps null: false
    end
  end
end
