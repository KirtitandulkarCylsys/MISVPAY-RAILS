class Api::V1::EtfSaleController < ApplicationController
    def index
  
      empid = params[:empid]
  
      emprole = params[:emprole]
  
      start_date = params[:start_date]
    end_date = params[:end_date]
      zone = params[:zone]
  
      region_code = params[:region_code]
  
      ufc_code = params[:ufc_code]
  
      rm_code = params[:rm_code]
  
      
  
      etfsale_details = EtfSaleService.etfsale_details(empid, emprole, start_date, end_date, zone, region_code, ufc_code, rm_code )
  
      render json: etfsale_details
  
    end
  
  end
  