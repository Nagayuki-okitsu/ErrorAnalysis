class Answer < ApplicationRecord
    belongs_to :question
    belongs_to :user #投稿用
    has_many :replys, dependent: :destroy
    has_many :nices, dependent: :destroy
    has_many :users, through: :nices #いいね用
    validates :answer, presence: true
end
