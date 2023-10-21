class Api::V1::ManageUserRtlRegionQueryDropdownController < ApplicationController
    def index
        channel_code=params[:channel_code]
        dropdown_details = ManageUserRtlRegionQueryDropdownService.get_dropdown_details(channel_code)
        render json: dropdown_details
       end
end
