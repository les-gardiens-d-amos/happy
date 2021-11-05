class User < ApplicationRecord
    validates :name, presence: true
    validates :password, presence: true
    validates :email, presence: true
    validates_uniqueness_of :email
end
