class Api::V1::ManageUserCityDropdownController < ApplicationController
  def index
    city_type=params[:city_type]
    valid_upto=params[:valid_upto]
    dropdown_details = ManageUserCityDropdownService.get_dropdown_details(city_type,valid_upto)
    render json: dropdown_details
   end
end
