class Api::V1::NfoController < ApplicationController
  def index
    emp_id = params[:emp_id]
    emprole = params[:emprole]
    zone = params[:zone]
    region = params[:region]
    ufc = params[:ufc]
    rm = params[:rm]
    nfo_details = NfoSalesService.get_nfo_sales_details(emp_id, emprole,zone,region,ufc,rm)
    render json: nfo_details
  end

end
