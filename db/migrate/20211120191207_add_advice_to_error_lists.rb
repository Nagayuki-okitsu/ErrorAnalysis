class AddAdviceToErrorLists < ActiveRecord::Migration[6.1]
  def change
    add_column :error_lists, :advice, :text
  end
end
