class Api::V1::AumUfcController < ApplicationController
  def index
    report_period = params[:report_period]
		zone = params[:zone]
    region_code = params[:region_code]
		aum_ufc_details = AumUfcService.get_aum_ufc_details(report_period, zone, region_code)
		render json: aum_ufc_details    
  end   
end
