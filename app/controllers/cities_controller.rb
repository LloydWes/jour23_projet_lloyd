class CitiesController < ApplicationController
  def index
    @all_cities_array = City.all
  end
  def show
    puts "*"*60, params['id']
    @city = City.find_by(id: params['id'])
  end 
end
