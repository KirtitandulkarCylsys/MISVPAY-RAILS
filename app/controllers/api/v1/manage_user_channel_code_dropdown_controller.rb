class Api::V1::ManageUserChannelCodeDropdownController < ApplicationController
   def index
    dropdown_details = ManageUserChannelCodeDropdownService.get_dropdown_details()
    render json: dropdown_details
   end
end
