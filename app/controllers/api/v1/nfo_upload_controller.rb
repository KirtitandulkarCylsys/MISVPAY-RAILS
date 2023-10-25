class Api::V1::NfoUploadController < ApplicationController
  def create
    data_array = params[:data_hash]
    if data_array.nil?
      render json: { error: 'data_hash is missing in the request' }, status: :bad_request
    else
      permitted_attributes = data_array.map do |data|
        data.permit(:trn_type, :inhouse_number, :type, :plan, :plan_description, :from_scheme, :from_plan, :from_plan_desc, :amc_code, :sch_desc, :folio_number, :investor_name, :amount, :amt_incr, :arn_no, :arn_name, :ufc_code, :ufc_name, :region, :zone, :channel_name, :mod_channel, :scheme_code, :branch_code, :pin, :t30b30flag, :platform, :trxn_date, :scheme_description, :map_rmcode, :ria_code, :arn_ria, :platform2, :mobile_number, :email_id, :type2)
      end
      upload_data = NfoUploadService.create_nfo_upload_details(permitted_attributes)
      render json: upload_data
    end
  end
end


# class Api::V1::NfoUploadController < ApplicationController
#   def create
#     data_array = params[:data_hash]
#     result = []
#     permitted_attributes=[];
#     if data_array.nil?
#       render json: { error: 'data_hash is missing in the request' }, status: :bad_request
#     else
#       data_array.each do |data|
#         permitted_attributes = data.permit(:trn_type, :inhouse_number, :type, :plan, :plan_description, :from_scheme, :from_plan, :from_plan_desc, :amc_code, :sch_desc, :folio_number, :investor_name, :amount, :amt_incr, :arn_no, :arn_name, :ufc_code, :ufc_name, :region, :zone, :channel_name, :mod_channel, :scheme_code, :branch_code, :pin, :t30b30flag, :platform, :trxn_date, :scheme_description, :map_rmcode, :ria_code, :arn_ria, :platform2, :mobile_number, :email_id, :type2)
#       end
#       upload_data = NfoUploadService.create_nfo_upload_details(permitted_attributes)
#       result << upload_data
#       render json: result
#     end
#   end
# end