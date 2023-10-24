class Api::V1::FolioReportController < ApplicationController
    def index
  
      empid = params[:empid]
      emprole = params[:emprole]
      quarter = params[:quarter]
      zone = params[:zone]
      region_code = params[:region_code]
      ufc_code = params[:ufc_code]
      rm_code = params[:rm_code]
      period_code = params[:period_code]
      report_type = params[:report_type]
      channel_code = params[:channel_code]
  
      folio_details = FolioReportService.folio_details(empid, emprole,quarter,zone, region_code, ufc_code, rm_code,period_code,report_type,channel_code)
      render json: folio_details
    end
  end
  