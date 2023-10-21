class Api::V1::ManageUserLocationDropdownController < ApplicationController
  def index
    employee_role=params[:employee_role]
    dropdown_details = ManageUserLocationDropdownService.get_dropdown_details(employee_role)
    render json: dropdown_details
   end
end
