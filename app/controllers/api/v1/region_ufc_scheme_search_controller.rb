class Api::V1::RegionUfcSchemeSearchController < ApplicationController
  def index
    emp_id=params[:emp_id]
    emp_role=params[:emp_role]
    quarter=params[:quarter]
    start_date=params[:start_date]
    end_date=params[:end_date]
    zone=params[:zone]
    region_code=params[:region_code]
    ufc_code=params[:ufc_code]
    rm_code=params[:rm_code]
    channel_code=params[:channel_code]
      dropdown_details = RegionUfcSchemeReportSearchService.get_dropdown_details(emp_id,emp_role,quarter,start_date,end_date,zone,region_code,ufc_code,rm_code,channel_code)
      render json: dropdown_details
  end
end
