class Api::V1::SummaryTransactionsController < ApplicationController
  def index
    employee_id = params[:employee_id]
    emprole = params[:emprole]
    quarter = params[:quarter]
    start_date = params[:start_date]
    end_date = params[:end_date]
    select_type = params[:select_type]
    scheme_code = params[:scheme_code]
    channel = params[:channel]
    zone = params[:zone]
    region = params[:region]
    ufc = params[:ufc]
    rm = params[:rm]
    common_report = params[:common_report]
    transaction_summary_report = SummaryTransactionService.get_transaction_summary_report(employee_id,
    emprole, quarter,start_date, end_date,  select_type,  scheme_code, channel,
    zone, region, ufc, rm, common_report)
    render json: transaction_summary_report
  end
end
