class CreateErrorLists < ActiveRecord::Migration[6.1]
  def change
    create_table :error_lists do |t|
      t.string :err_mess
      t.string :cause
      t.text :advice

      t.timestamps
    end
  end
end
