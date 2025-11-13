
# Mise a jour par Marie-Eve Bouchard — 2025-11-13

require 'faker'
Faker::Config.locale = 'fr-CA'

# --- USERS ---

# Création d'un admin fixe
admin = User.find_or_create_by!(email: 'admin@example.com') do |u|
  u.password = 'password'
  u.password_confirmation = 'password'
  u.admin = true
end

# Création d'utilisateurs réguliers
users = []
5.times do |i|
  users << User.find_or_create_by!(email: "user#{i+1}@example.com") do |u|
    u.password = 'password'
    u.password_confirmation = 'password'
    u.admin = false
  end
end

# --- BUSINESSES ET MENUS ---
10.times do
  owner = users.sample  # chaque restaurant appartient à un utilisateur aléatoire

  business = owner.businesses.find_or_create_by!(name: Faker::Restaurant.name) do |b|
    b.description = Faker::Restaurant.description
    b.phone = Faker::PhoneNumber.phone_number
    b.email = Faker::Internet.email
    b.site_web = Faker::Internet.url
  end

  # Ajout des menus et items
  business.menus.destroy_all  # pour éviter duplication si seed rerun
  menu_weekend = business.menus.create!(title: "Fin de semaine")
  %w[Dejeuner Diner Souper].each do |meal|
    meal_menu = menu_weekend.menus.create!(title: meal)
    4.times do
      meal_menu.items.create!(
        name: Faker::Food.vegetables,
        price: Faker::Commerce.price(range: 3..20.0),
        description: Faker::Food.description
      )
    end
  end
end

puts "Seeds terminées : #{User.count} utilisateurs, #{Business.count} restaurants, menus et items créés."
