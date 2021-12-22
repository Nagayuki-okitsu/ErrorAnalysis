class Question < ApplicationRecord
    has_many :answers #dependent: :destroyしないのはDeleteNiceを保存するため
    belongs_to :user
    validates :title, :content, presence: true
    validates :title, length: { maximum: 30}, allow_nil: true
end
