class Answer < ApplicationRecord
    belongs_to :question
    belongs_to :user
    has_many :reply, dependent: :destroy
    validates :answer, presence: true
end
