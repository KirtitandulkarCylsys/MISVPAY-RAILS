class Api::V1::MandateReportController < ApplicationController
    def index
        empid = params[:empid]
        emp_role = params[:emp_role]
        year_quater = params[:year_quater]
        start_date = params[:start_date]
        end_date = params[:end_date]
        stype = params[:stype]
        status = params[:status]
        scheme_code = params[:scheme_code]
        chn_code = params[:chn_code]
        zone = params[:zone]
        region_code = params[:region_code]
        ufc_code = params[:ufc_code]
        rmcode = params[:rmcode]
        common_report = params[:common_report]
        mandate_summary_report = MandateReportService.get_mandate_report(empid,
            emp_role, year_quater, start_date, end_date,  stype, status,  scheme_code, chn_code,
        zone, region_code, ufc_code, rmcode, common_report)
        render json: mandate_summary_report
      end
    end
    