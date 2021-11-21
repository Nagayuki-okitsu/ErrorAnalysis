class CreateErrorLists < ActiveRecord::Migration[6.1]
  def change
    create_table :error_lists do |t|
      t.string :err_mess
      t.string :answer

      t.timestamps
    end
  end
end
