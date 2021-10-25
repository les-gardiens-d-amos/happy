class Amo < ApplicationRecord
    validates :user_id, presence: true
    validates :animal_id, presence: true
    validates :species, presence: true
    validates :amos_type, presence: true
    validates :name, presence: true
    validates :image_path, presence: true
end
