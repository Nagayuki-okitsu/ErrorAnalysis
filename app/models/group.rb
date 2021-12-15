class Group < ApplicationRecord
    has_many :group_users
    has_many :users, through: :group_users
    accepts_nested_attributes_for :group_users

    validates :name, presence: true
    validates :name, length: { maximum: 8}, allow_nil: true
    validates :name, uniqueness: true, allow_nil: true
end
