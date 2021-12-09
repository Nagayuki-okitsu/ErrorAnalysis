class AddContentTypeToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :image_content_type, :string
  end
end
