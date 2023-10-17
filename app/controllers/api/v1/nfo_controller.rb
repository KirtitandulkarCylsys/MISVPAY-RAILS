require 'roo'
class Api::V1::NfoController < ApplicationController
  def index
    emp_id = params[:emp_id]
    emprole = params[:emprole]
    zone = params[:zone]
    region = params[:region]
    ufc = params[:ufc]
    rm = params[:rm]
    nfo_details = NfoSalesService.get_nfo_sales_details(emp_id, emprole,zone,region,ufc,rm)
    render json: nfo_details
  end

  def create
    emp_id = params[:emp_id]
    emprole = params[:emprole]
    zone = params[:zone]
    region = params[:region]
    ufc = params[:ufc]
    rm = params[:rm]
    excel_file = params[:file]
    if excel_file
      spreadsheet = Roo::Excelx.new(excel_file.tempfile)
      header = spreadsheet.row(1)
      data = []

      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        data << row
      end
      nfo_details = NfoSalesService.get_nfo_sales_details(emp_id, emprole,zone,region,ufc,rm).create(data)
      render json: nfo_details, status: :ok
    else
      render json: { error: 'No file provided' }, status: :unprocessable_entity
    end
  end
end
