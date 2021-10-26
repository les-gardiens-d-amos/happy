class Catch < ApplicationRecord
    validates :long, presence: true
    validates :lat, presence: true
    validates :altitude, presence: true
    validates :accuracy, presence: true
    validates :amos_id, presence: true
end
