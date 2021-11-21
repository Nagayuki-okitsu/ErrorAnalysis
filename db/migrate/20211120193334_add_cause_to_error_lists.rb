class AddCauseToErrorLists < ActiveRecord::Migration[6.1]
  def change
    add_column :error_lists, :cause, :string
  end
end
