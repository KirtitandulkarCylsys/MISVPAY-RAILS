class Api::V1::NfoUploadController < ApplicationController
  def create
    data_array = params[:data_hash]
    result = []

    if data_array.nil?
      render json: { error: 'data_hash is missing in the request' }, status: :bad_request
    else
      data_array.each do |data|
        # Permit and convert the data hash
        permitted_attributes = data.permit(:trn_type, :inhouse_number, :type, :plan, :plan_description, :from_scheme, :from_plan, :from_plan_desc, :amc_code, :sch_desc, :folio_number, :investor_name, :amount, :amt_incr, :arn_no, :arn_name, :ufc_code, :ufc_name, :region, :zone, :channel_name, :mod_channel, :scheme_code, :branch_code, :pin, :t30b30flag, :platform, :trxn_date, :scheme_description, :map_rmcode, :ria_code, :arn_ria, :platform2, :mobile_number, :email_id, :type2)

        # Create nfo_upload_details and add to the result array
        upload_data = NfoUploadService.create_nfo_upload_details([permitted_attributes])
        result << upload_data
      end

      render json: result
    end
  end
end