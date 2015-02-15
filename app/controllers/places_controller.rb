class PlacesController < ApplicationController
    def index
    end

    def show
        @place = session[:last_place_search_result].select{ |place| place[:id] == params[:id] }.first
        @name = @place.name
        @street = @place.street
        @mapurl = @place.blogmap
    end

    def search
        @places = BeermappingApi.places_in(params[:city])
        if @places.empty?
            redirect_to places_path, notice: "No locations in #{params[:city]}"
        else
            session[:last_place_search_result] = @places
            render :index
        end

    end
end
