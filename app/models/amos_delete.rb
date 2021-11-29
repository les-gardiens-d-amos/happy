class AmosDelete < ApplicationRecord
  validates :animal_id, presence: true
  validates :species, presence: true
  validates :amos_type, presence: true
  validates :name, presence: true
  validates :location, presence: true

  def self.save_amos_deleted(amos)
    # temporally
    AmosDelete.new(animal_id: amos.animal_id, species: amos.species, amos_type: amos.amos_type, name: amos.name, level: amos.level, location: amos.location).save
  end
end
