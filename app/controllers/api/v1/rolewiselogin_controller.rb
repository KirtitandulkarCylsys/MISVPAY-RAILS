class Api::V1::RolewiseloginController < ApplicationController
  def index
    emp_id = params[:emp_id]
    current_date = params[:current_date]
    quarter_no = params[:quarter_no]
    rolewise_report = RolewiseLoginService.get_user_details(emp_id, current_date,quarter_no)
    render json: rolewise_report
  end   
end
