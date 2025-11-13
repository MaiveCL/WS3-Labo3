# Mise a jour par Marie-Eve Bouchard — 2025-11-13

class Business < ApplicationRecord
    belongs_to :user
    has_many :menus
    accepts_nested_attributes_for :menus
end
