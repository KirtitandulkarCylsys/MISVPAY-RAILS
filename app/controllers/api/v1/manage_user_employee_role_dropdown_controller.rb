class Api::V1::ManageUserEmployeeRoleDropdownController < ApplicationController
    def index
        channel_code=params[:channel_code]
        dropdown_details = ManageUserEmployeeRoleDropdownService.get_dropdown_details(channel_code)
        render json: dropdown_details
       end
end
