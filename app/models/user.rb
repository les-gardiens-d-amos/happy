class User < ApplicationRecord
  validates :name, presence: true
  validates :password, presence: true
  validates :email, presence: true

  def self.update_connected_at(user)
    user.connected_at = Time.zone.now
    user.save
  end
end
