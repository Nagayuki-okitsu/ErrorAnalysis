class Reply < ApplicationRecord
    belongs_to :answer
    belongs_to :user
    validates :reply, presence: true
end
