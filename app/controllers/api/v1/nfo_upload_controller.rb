class Api::V1::NfoUploadController < ApplicationController
  def create
    data_array = params[:data_array]    
    result = []         
    for data in data_array
      trn_type = data[:trn_type]
      inhouse_number = data[:inhouse_number]
      type = data[:type]
      plan = data[:plan]
      plan_description = data[:plan_description]
      from_scheme = data[:from_scheme]
      from_plan = data[:from_plan]
      from_plan_desc = data[:from_plan_desc]
      amc_code = data[:amc_code]
      sch_desc = data[:sch_desc]
      folio_number = data[:folio_number]
      investor_name = data[:investor_name]
      amount = data[:amount]
      amt_incr = data[:amt_incr]
      arn_no = data[:arn_no]
      arn_name = data[:arn_name]
      ufc_code = data[:ufc_code]
      ufc_name = data[:ufc_name]
      region = data[:region]
      zone = data[:zone]
      channel_name = data[:channel_name]
      mod_channel = data[:mod_channel]
      scheme_code = data[:scheme_code]
      branch_code = data[:branch_code]
      pin = data[:pin]
      t30b30flag = data[:t30b30flag]
      platform = data[:platform]
      trxn_date = data[:trxn_date]
      scheme_description = data[:scheme_description]
      map_rmcode = data[:map_rmcode]
      ria_code = data[:ria_code]
      arn_ria = data[:arn_ria]
      platform2 = data[:platform2]
      mobile_number = data[:mobile_number]
      email_id = data[:email_id]
      type2 = data[:type2]
      upload_data = NfoUploadService.get_nfo_upload_details(trn_type, inhouse_number, type, plan, plan_description, from_scheme, from_plan, from_plan_desc, amc_code, sch_desc, folio_number, investor_name, amount, amt_incr, arn_no, arn_name, ufc_code, ufc_name, region, zone, channel_name, mod_channel, scheme_code, branch_code, pin, t30b30flag, platform, trxn_date, scheme_description, map_rmcode, ria_code, arn_ria, platform2, mobile_number, email_id, type2)
   
      result << upload_data 
    end    
    render json: result
  end
end
