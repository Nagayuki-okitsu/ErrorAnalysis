class DropTableDeleteAnswers < ActiveRecord::Migration[6.1]
  def change
    drop_table :delete_answers do |t|
      t.string "delete_answer_id"
      t.bigint "user_id"
      t.timestamps null: false
    end
  end
end
