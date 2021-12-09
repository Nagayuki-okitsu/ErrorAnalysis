class RemoveDleleteansFromQuestions < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :answer, :text
  end
end
