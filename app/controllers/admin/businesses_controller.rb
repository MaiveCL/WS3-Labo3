# Marie-Ève — 2025-11-13
class Admin::BusinessesController < Admin::BaseController
    def index
        @businesses = Business.order(name: :desc)

        respond_to do |format|
            format.html
        end
    end

    def show
        @business = Business.find(params[:id])
    end
end
