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

    amos_types = amos_types.tally
    amos_species = amos_species.tally
    
    { amos_types: amos_types, amos_species: amos_species, amos_location: amos_location }
  end
end
