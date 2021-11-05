class Amo < ApplicationRecord
    validates :user_id, presence: true
    validates :animal_id, presence: true
    validates :species, presence: true
    validates :amos_type, presence: true
    validates :name, presence: true
    validates :image_path, presence: true

    def self.change_amos_name(id, name)
        amo = Amo.find(id)
        amo.name = name
        amo.save
        return amo
    end

    def self.find_animal_id_by_user(id)
        Amo.where(:user_id => id).pluck(:animal_id).uniq
    end
end
