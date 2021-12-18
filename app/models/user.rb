class User < ApplicationRecord
    has_many :questions
    has_many :answers
    has_many :replys
    has_many :group_users
    has_many :nices, dependent: :destroy
    has_many :nice_answers, through: :nices, source: :answer
    has_many :groups, through: :group_users

    has_secure_password validations: false
    validates :name, :email, :password, :password_confirmation, presence: true
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/i }, allow_nil: true
    validates :name, length: { maximum: 8}, allow_nil: true
    validates :password, confirmation: true, allow_nil: true
    validates :password, length: { in: 4..18}, allow_nil: true
    validates :email, uniqueness: true, allow_nil: true

    def own?(object)
        id == object.user_id
    end
    
    def nice(answer)
        nices.find_or_create_by(answer: answer)
    end
    
    def nice?(answer)
        nice_answers.include?(answer)
    end
    
    def not_nice(answer)
        nice_answers.delete(answer)
    end
end

