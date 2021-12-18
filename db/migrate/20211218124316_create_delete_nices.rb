class CreateDeleteNices < ActiveRecord::Migration[6.1]
  def change
    create_table :delete_nices do |t|
      t.integer :delete_answer_include_nice
      t.timestamps
    end
  end
end
