# Marie-Eve Bouchard — 2025-11-13

class User < ApplicationRecord
  # --- Devise modules ---
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relations
  has_many :businesses

  # Validations
  validates :email, uniqueness: true, presence: true

  # Fonctionnalité privée au modèle
  private
  def valide_email
    unless self.email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      errors.add(:email, "is not an email")
    end
  end
end
