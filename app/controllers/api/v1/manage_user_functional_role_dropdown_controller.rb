class Api::V1::ManageUserFunctionalRoleDropdownController < ApplicationController
    def index
        dropdown_details = ManageUserFunctionalRoleDropdownService.get_dropdown_details
        render json: dropdown_details
      end
end
