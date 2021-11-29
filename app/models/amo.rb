class Amo < ApplicationRecord
  validates :user_id, presence: true
  validates :animal_id, presence: true
  validates :species, presence: true
  validates :amos_type, presence: true
  validates :name, presence: true
  validates :image_path, presence: true
  validates :image_id, presence: true
  validates :location, presence: true

  def self.change_amos_name(id, name)
    amo = Amo.find(id)
    amo.name = name
    amo.save
    amo
  end

  def self.change_amo_location(id, location)
    amo = Amo.find(id)
    amo.location = location
    amo.save
    amo
  end

  def self.find_animal_id_by_user(id)
    Amo.where(user_id: id).pluck(:animal_id).uniq
  end

  def self.find_amos_without_location
    Amo.where(location: nil).pluck(:id)
  end

  def self.compute_global_stats
    amos = Amo.all
    amos_types = []
    amos_species = []
    amos_location = []

    amos.each do |amo|
      amos_types << amo.amos_type.downcase
      amos_species << amo.species.downcase
      amos_location << amo.location
    end

    {
      amos_types: amos_types.tally,
      amos_species: amos_species.tally,
      amos_location: amos_location,
      last_week_amos: count_last_week_amos,
      last_week_new_users: User.count_users,
      last_week_users_connected: User.count_last_week_users
    }
  end

  def self.count_last_week_amos
    index = 0
    last_week_amos = []
    while index < 8
      last_week_amos << { index.day.ago.utc.to_s => Amo.where(created_at: (index + 1).day.ago.utc..index.day.ago.utc).count }
      index += 1
    end
    last_week_amos.reverse
  end
end
