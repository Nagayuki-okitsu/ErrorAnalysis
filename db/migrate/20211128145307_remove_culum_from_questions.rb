class RemoveCulumFromQuestions < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :key_list, :string
  end
end
