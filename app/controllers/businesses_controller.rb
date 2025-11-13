# Marie-Ève — 2025-11-13

class BusinessesController < ApplicationController
    def index
        @businesses = Business.order(name: :asc)

        respond_to do |format|
            format.html
            format.json { render json: @businesses.to_json }
            format.xml  { render xml: @businesses.as_json.to_xml }
        end
    end

    def show
        @business = Business.find(params[:id])

        respond_to do |format|
            format.html
            format.json {
                render json: @business.to_json(
                    include: {
                        menus: {
                            include: {
                                items: {},
                                menus: { include: :items }  # sous-menus avec leurs items
                            }
                        }
                    }
                )    
            }

            format.xml {
                render xml: @business.as_json(
                    include: {
                        menus: {
                            include: {
                                items: {},
                                menus: { include: :items }
                            }
                        }
                    }
                ).to_xml
            }
        end
    end
end
