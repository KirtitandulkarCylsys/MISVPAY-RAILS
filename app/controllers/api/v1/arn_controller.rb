class Api::V1::ArnController < ApplicationController
  def index
    employee_id = params[:employee_id]
    emprole = params[:emprole]
    start_date = params[:start_date]
    end_date = params[:end_date]
    quarter = params[:quarter]
    quarter_last_date = params[:quarter_last_date]
    multicity = params[:multicity]      
    zone = params[:zone]
    region = params[:region]
    ufc = params[:ufc]
    rm = params[:rm]
    select_type = params[:select_type]
    channel = params[:channel]  

    arn_report = SummaryTransactionService.get_arn_report(employee_id,emprole,start_date, end_date,quarter,quarter_last_date, multicity,zone, region, ufc, rm, select_type, channel)

    render json: arn_report
  end
end
