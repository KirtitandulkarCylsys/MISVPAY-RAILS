class Api::V1::AumController < ApplicationController
  def index

    empid = params[:empid]

    emprole = params[:emprole]

    quarter = params[:quarter]

    period_code = params[:period_code]

    zone = params[:zone]

    region_code = params[:region_code]

    ufc_code = params[:ufc_code]

    rm_code = params[:rm_code]

    chn_code = params[:chn_code]

    common_report = params[:common_report]

    aum_details = AumService.get_aum_details(empid, emprole, quarter, period_code, zone, region_code, ufc_code, rm_code, chn_code, common_report)

    render json: aum_details

  end

end

