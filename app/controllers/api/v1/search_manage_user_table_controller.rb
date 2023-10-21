class Api::V1::SearchManageUserTableController < ApplicationController
    def index
      emp_id=params[:emp_id]
      emp_name=params[:emp_name]
      channel_code=params[:channel_code]
      emp_role=params[:emp_role]
      status=params[:status]
      location=params[:location]
        dropdown_details = SearchManageUserTableService.get_dropdown_details(emp_id,emp_name,channel_code,emp_role,status,location)
        render json: dropdown_details
       end
end
