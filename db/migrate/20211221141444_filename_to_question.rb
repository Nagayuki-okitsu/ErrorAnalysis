class FilenameToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :file_name, :string
    add_column :questions, :file_name_2, :string
    add_column :questions, :file_name_3, :string
  end
end
