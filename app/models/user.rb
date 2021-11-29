class User < ApplicationRecord
  validates :name, presence: true
  validates :password, presence: true
  validates :email, presence: true

  def self.update_connected_at(user)
    user.connected_at = Time.zone.now
    user.save
  end

  def self.count_last_week_users(date)
    index = 0
    last_week_users = []
    while index < 8
      last_week_users << { index.day.ago.utc.to_s => User.where("#{date}": (index + 1).day.ago.utc..index.day.ago.utc).count }
      index += 1
    end
    last_week_users.reverse
  end
end
