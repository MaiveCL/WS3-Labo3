# Marie-Ève — 2025-11-13

class MesmenusController < ApplicationController

  before_action :authenticate_user!
  # est fourni par Devise et empêche l’accès aux non-connectés

  def index
    @businesses = current_user.businesses.order(name: :asc)
    # ne récupère que les restaurants appartenant à l’usager connecté
  end

  def show
    @business = current_user.businesses.find(params[:id])
    # permet d’afficher uniquement un restaurant qui appartient à l’usager
  rescue ActiveRecord::RecordNotFound
    redirect_to mesmenus_path
  end

end

# rails generate controller Mesmenus index show