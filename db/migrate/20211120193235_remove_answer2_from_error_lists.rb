class RemoveAnswer2FromErrorLists < ActiveRecord::Migration[6.1]
  def change
    remove_column :error_lists, :answer, :text
  end
end
