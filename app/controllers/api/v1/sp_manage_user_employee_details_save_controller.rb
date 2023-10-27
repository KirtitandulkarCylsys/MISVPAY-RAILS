class Api::V1::SpManageUserEmployeeDetailsSaveController < ApplicationController

  def index   
    emp_id=params[:emp_id]
    channel_code= params[:channel_code]
    emp_role=params[:emp_role]
    location=params[:location]
    start_date=params[:start_date]
    end_date= params[:end_date]
    status=params[:status]
    remark= params[:remark]
    valid_from=params[:valid_from]
    valid_upto=params[:valid_upto]
    func_role=params[:func_role]
    last_updated_date=params[:last_updated_date]
    last_updated_user=params[:last_updated_user]
    kam_flag=params[:kam_flag]
    nam_group=params[:nam_group]
    region_code=params[:region_code]
    zone=params[:zone]
    reporting_role=params[:reporting_role]
    power_user_code=params[:power_user_code]
    city=params[:city]
    emp_name=params[:emp_name]
    emp_pass=params[:emp_pass]
    emailid=params[:emailid]
     dv_flag=params[:dv_flag]
     misvpay_code= params[:misvpay_code]
     sales_flag=params[:sales_flag]
     fscheme=params[:fscheme]
     mail=params[:mail]
     farn=params[:farn]
     summit_cat=params[:summit_cat]
     access_from= params[:access_from]
      access_upto=params[:access_upto]
      sap_ufc_code=params[:sap_ufc_code]
      sap_region_code=params[:sap_region_code]
      sap_zone_code= params[:sap_zone_code]
       schema=params[:schema]
      active=params[:active]
    dropdown_data = SpManageUserEmployeeDetailsSaveService.save_employee_data(emp_id,channel_code, emp_role,  location, start_date, end_date, status, remark, valid_from, valid_upto,
    func_role, last_updated_date, last_updated_user, kam_flag,nam_group, region_code,zone, reporting_role, power_user_code, city, emp_name, emp_pass, emailid,
     dv_flag, misvpay_code, sales_flag, fscheme, mail, farn, summit_cat, access_from,
      access_upto, sap_ufc_code, sap_region_code, sap_zone_code, schema, active)
    render json: dropdown_data
  end
  def create
    emp_id=params[:emp_id]
    channel_code= params[:channel_code]
    emp_role=params[:emp_role]
    location=params[:location]
    start_date=params[:start_date]
    end_date= params[:end_date]
    status=params[:status]
    remark= params[:remark]
    valid_from=params[:valid_from]
    valid_upto=params[:valid_upto]
    func_role=params[:func_role]
    last_updated_date=params[:last_updated_date]
    last_updated_user=params[:last_updated_user]
    kam_flag=params[:kam_flag]
    nam_group=params[:nam_group]
    region_code=params[:region_code]
    zone=params[:zone]
    reporting_role=params[:reporting_role]
    power_user_code=params[:power_user_code]
    city=params[:city]
    emp_name=params[:emp_name]
    emp_pass=params[:emp_pass]
    emailid=params[:emailid]
     dv_flag=params[:dv_flag]
     misvpay_code= params[:misvpay_code]
     sales_flag=params[:sales_flag]
     fscheme=params[:fscheme]
     mail=params[:mail]
     farn=params[:farn]
     summit_cat=params[:summit_cat]
     access_from= params[:access_from]
      access_upto=params[:access_upto]
      sap_ufc_code=params[:sap_ufc_code]
      sap_region_code=params[:sap_region_code]
      sap_zone_code= params[:sap_zone_code]
       schema=params[:schema]
      active=params[:active]
    dropdown_data = SpManageUserEmployeeDetailsSaveService.save_employee_data(emp_id,channel_code, emp_role,  location, start_date, end_date, status, remark, valid_from, valid_upto,
    func_role, last_updated_date, last_updated_user, kam_flag,nam_group, region_code,zone, reporting_role, power_user_code, city, emp_name, emp_pass, emailid,
     dv_flag, misvpay_code, sales_flag, fscheme, mail, farn, summit_cat, access_from,
      access_upto, sap_ufc_code, sap_region_code, sap_zone_code, schema, active)

    if dropdown_data.empty?
      render json: { message: 'Employee data not found' }, status: :not_found
    else
      render json: { message: 'Employee data saved successfully', dropdown_data: dropdown_data }, status: :created
    end
  end
end
