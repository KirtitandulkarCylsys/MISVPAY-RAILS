class Api::V1::ManageUserRhDropdownController < ApplicationController
  def index
    dropdown_details = ManageUserRhDropdownService.get_dropdown_details
    render json: dropdown_details
  end
end
