class Api::V1::ManageUserPostUpdateDataController < ApplicationController
  def update
    emp_id = params[:emp_id]
    channel_code = params[:channel_code]
    emp_role = params[:emp_role]
    location = params[:location]
    start_date = params[:start_date]
    status = params[:status]
    reporting_role = params[:reporting_role]
    power_user_code = params[:power_user_code]
    zone = params[:zone]
    region_code = params[:region_code]
    kam_flag = params[:kam_flag]
    nam_group = params[:nam_group]
    func_role = params[:func_role]
    city = params[:city]
    end_date = params[:end_date]
    dv_flag = params[:dv_flag]
    remark = params[:remark]
    valid_from = params[:valid_from]
    valid_upto = params[:valid_upto]
    access_from = params[:access_from]
    access_upto = params[:access_upto]
    emp_name = params[:emp_name]
    emp_pass = params[:emp_pass]
    emailid = params[:emailid]
    last_updated_date =params[:last_updated_date]
    last_updated_user = params[:last_updated_user]
    dropdown_data = ManageUserPostUpdateDataService.update_employee_data(emp_id, channel_code, emp_role, location, start_date, status, reporting_role, power_user_code, zone, region_code,
      kam_flag, nam_group, func_role, city, end_date, dv_flag, remark, valid_from, valid_upto, access_from, access_upto, emp_name, emp_pass, emailid,last_updated_date,last_updated_user)

    if dropdown_data
      render json: { message: 'Employee data saved successfully', dropdown_data: dropdown_data }, status: :created
    else
      render json: { message: 'Employee data not found' }, status: :not_found
    end
  end
end
