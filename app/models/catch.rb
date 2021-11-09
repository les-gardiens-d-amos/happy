class Catch < ApplicationRecord
  validates :long, presence: true
  validates :lat, presence: true
  validates :altitude, presence: true
  validates :accuracy, presence: true
  validates :amos_id, presence: true

  def self.remove_catch_with_amo(amos_id)
    catches = Catch.find_by(amos_id: amos_id)
    catches.delete
  end
end
