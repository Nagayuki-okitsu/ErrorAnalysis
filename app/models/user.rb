class User < ApplicationRecord
    has_many :question
    has_many :answer
    has_many :reply

    has_secure_password validations: false
    validates :name, :email, :password, :password_confirmation, presence: true
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/i }, allow_nil: true
    validates :name, length: { maximum: 8}, allow_nil: true
    validates :password, confirmation: true, allow_nil: true
    validates :password, length: { in: 4..18}, allow_nil: true
    validates :email, uniqueness: true, allow_nil: true
end

