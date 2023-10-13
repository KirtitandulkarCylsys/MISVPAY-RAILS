class Api::V1::ManageUserGetEditDataController < 
  
  def edit
    @user=ManageUser.find(params[:emp_id])
  end

    def update
      emp_id=params[:emp_id]
      channel_code=params[:channel_code]
      emp_role=params[:emp_role]
      location=params[:location]
      start_date=params[:start_date]
      status=params[:status]
      ManageUserGetEditDataService.update_data(emp_id,channel_code,emp_role,location,start_date,status)
      render json: dropdown_details
    end
end
