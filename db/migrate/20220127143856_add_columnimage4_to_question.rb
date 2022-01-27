class AddColumnimage4ToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :image_4, :binary
    add_column :questions, :image_content_type_4, :string
    add_column :questions, :file_name_4, :string
    add_column :questions, :image_5, :binary
    add_column :questions, :image_content_type_5, :string
    add_column :questions, :file_name_5, :string
  end
end
