class Api::V1::ManageUserQuarterDropdownController < ApplicationController
  def index
    dropdown_details = ManageUserQuarterDropdownService.get_dropdown_details
    render json: dropdown_details
  end
end
