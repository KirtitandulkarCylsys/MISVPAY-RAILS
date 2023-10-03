class Api::V1::ManageUserPowerUserDropdownController < ApplicationController 
        def index
            dropdown_details = ManageUserPowerUserDropdownService.get_dropdown_details
            render json: dropdown_details
          end

end
