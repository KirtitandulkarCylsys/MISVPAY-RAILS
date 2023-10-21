class Api::V1::ManageUserRmDropdownController < ApplicationController
  def index
    dropdown_details = ManageUserRmDropdownService.get_dropdown_details
    render json: dropdown_details
  end
end
