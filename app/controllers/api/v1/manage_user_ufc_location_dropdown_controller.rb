class Api::V1::ManageUserUfcLocationDropdownController < ApplicationController
    def index
      region_code=params[:region_code]
        channel_code=params[:channel_code]
        valid_upto=params[:valid_upto]
        dropdown_details = ManageUserUfcLocationDropdownService.get_dropdown_details(region_code,channel_code,valid_upto)
        render json: dropdown_details
       end
end
