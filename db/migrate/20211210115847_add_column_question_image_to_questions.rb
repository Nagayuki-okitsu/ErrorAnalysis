class AddColumnQuestionImageToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :image_2, :binary
    add_column :questions, :image_content_type_2, :string
    add_column :questions, :image_3, :binary
    add_column :questions, :image_content_type_3, :string
  end
end
