class AddColumnToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_reference :questions, :user, foreign_key: true
  end
end
