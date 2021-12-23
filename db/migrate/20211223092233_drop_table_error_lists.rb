class DropTableErrorLists < ActiveRecord::Migration[6.1]
  def change
    drop_table :error_lists do |t|
      t.string :err_mess
      t.string :cause
      t.string :advice
      t.timestamps null: false
    end
  end
end
