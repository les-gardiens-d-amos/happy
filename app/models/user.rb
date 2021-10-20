class User < ApplicationRecord
    validates :name, presence: true

    def self.find_user_by_name(name)
        User.where(name: name)
    end
end
