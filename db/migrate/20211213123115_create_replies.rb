class CreateReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :replies do |t|
      t.text :reply
      t.references :answer
      t.references :user

      t.timestamps
    end
  end
end
