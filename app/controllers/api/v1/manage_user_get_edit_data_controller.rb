class Api::V1::ManageUserGetEditDataController <  ApplicationController
  def index
    emp_id=params[:emp_id]
    channel_code=params[:channel_code]
    emp_role=params[:emp_role]
    location=params[:location]
    start_date=params[:start_date]
    status=params[:status]
      dropdown_details = ManageUserGetEditDataService.edit_data(emp_id,channel_code,emp_role,location,start_date,status)
      render json: dropdown_details
     end
  
end

