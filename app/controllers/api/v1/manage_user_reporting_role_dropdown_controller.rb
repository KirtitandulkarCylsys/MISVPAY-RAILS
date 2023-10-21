class Api::V1::ManageUserReportingRoleDropdownController < ApplicationController
    def index
        dropdown_details = ManageUserReportingRoleDropdownService.get_dropdown_details
        render json: dropdown_details
      end
end
