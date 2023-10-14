class Api::V1::AccountSummaryController < ApplicationController
    def index
      employee_id = params[:employee_id]
      employee_role = params[:employee_role]
      quarter = params[:quarter]
      start_date = params[:start_date]
      end_date = params[:end_date]
      amount = params[:amount]
      condition = params[:condition]
      transaction_type = params[:transaction_type]
      ufc = params[:ufc]
      zone = params[:zone]
      region_code = params[:region_code]
      ufc_code = params[:ufc_code]
      rmcode = params[:rmcode]
      no_mapping = params[:no_mapping]
      channel_code = params[:channel_code]
      common_report = params[:common_report]
      account_summary_report = AccountSummaryService.get_account_summary_report_rm(employee_id,employee_role,quarter,start_date, end_date, amount, condition, transaction_type,ufc,zone,region_code,ufc_code,rmcode,no_mapping,channel_code,common_report)
      render json: account_summary_report
    end
  end
