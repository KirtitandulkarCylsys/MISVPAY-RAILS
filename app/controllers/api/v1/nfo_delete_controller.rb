# Example in your controller
class Api::V1::NfoDeleteController < ApplicationController
  def destroy
    request_body = JSON.parse(request.body.read)
    emp_id = request_body['emp_id']
    emprole = request_body['emprole']
    zone = request_body['zone']
    region = request_body['region']
    ufc = request_body['ufc']
    rm = request_body['rm']
    nfo_details = NfoDeleteService.nfo_delete_details(emp_id, emprole, zone, region, ufc, rm)
    render json: nfo_details
  end
end

