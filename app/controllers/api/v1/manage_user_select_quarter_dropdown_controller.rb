class Api::V1::ManageUserSelectQuarterDropdownController < ApplicationController
  def index
    dropdown_details = ManageUserSelectQuarterDropdownService.get_dropdown_details
    render json: dropdown_details
  end
end
