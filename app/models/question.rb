class Question < ApplicationRecord
    has_many :answers #dependent: :destroyしないのはDeleteNiceを保存するため
    belongs_to :user
    validates :title, :content, presence: true
end
