class AddColumnToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :key_list, :string
  end
end
