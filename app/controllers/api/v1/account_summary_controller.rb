class Api::V1::AccountSummaryController < ApplicationController
    def index

      employee_id = params[:employee_id]
      employee_role = params[:employee_role]
      quarter = params[:quarter]
      account_no = params[:account_no]
      pan_no = params[:pan_no]
      pin_code = params[:pin_code]
      arn_no = params[:arn_no]
      subARN_no = params[:subARN_no]
      ufc = params[:ufc]
      amount = params[:amount]
      condition = params[:condition]
      karvy_location = params[:karvy_location]
      start_date = params[:start_date]
      end_date = params[:end_date]
      scheme_code = params[:scheme_code]
      ria_code = params[:ria_code]
      trans_RM_code = params[:trans_RM_code]
      ihno = params[:ihno]
      scheme_type = params[:scheme_type]
      euin = params[:euin]
      transaction_type = params[:transaction_type]
      bsf = params[:bsf]
      no_mapping = params[:no_mapping]
      zone = params[:zone]
      region_code = params[:region_code]
      ufc_code = params[:ufc_code]
      rmcode = params[:rmcode]
      channel_code = params[:channel_code]
      common_report = params[:common_report]

      account_summary_report = AccountSummaryService.get_account_summary_report_rm(
      employee_id,
      employee_role,
      quarter,
      account_no,
      pan_no,
      pin_code,
      arn_no,
      subARN_no,
      ufc,
      amount,
      condition,
      karvy_location,
      start_date,
      end_date,
      scheme_code,
      ria_code,
      trans_RM_code,
      ihno,
      scheme_type,
      euin,
      transaction_type,
      bsf,
      no_mapping,
      zone,
      region_code,
      ufc_code,
      rmcode,
      channel_code,
      common_report)
      render json: account_summary_report
    end
  end
