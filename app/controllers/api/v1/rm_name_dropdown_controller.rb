class Api::V1::RmNameDropdownController < ApplicationController
    def index
        emp_role=params[:emp_role]
        channel_code=params[:channel_code]
        valid_upto=params[:valid_upto]
        dropdown_details = RmNameDropdownService.get_dropdown_details(emp_role,channel_code,valid_upto)
        render json: dropdown_details
    end
end
