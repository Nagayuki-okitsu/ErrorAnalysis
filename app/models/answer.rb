class Answer < ApplicationRecord
    belongs_to :question
    belongs_to :user
    has_many :reply
    validates :answer, presence: true
end
