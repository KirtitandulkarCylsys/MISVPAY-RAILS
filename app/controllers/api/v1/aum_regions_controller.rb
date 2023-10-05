class Api::V1::AumRegionsController < ApplicationController
	def index
		report_period = params[:report_period]
		zone = params[:zone]
		aum_region_details = AumRegionService.get_aum_region_details(report_period,zone)
		render json: aum_region_details    
  end   
end
