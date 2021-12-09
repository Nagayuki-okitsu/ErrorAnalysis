class AddPartNumberToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :key, :string
    add_column :questions, :image, :binary
    add_column :questions, :answer, :text
  end
end
