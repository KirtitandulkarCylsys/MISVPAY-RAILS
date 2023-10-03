class Api::V1::ManageUserRegionDropdownController < ApplicationController
  def index
  channel_code=params[:channel_code]
  valid_upto=params[:valid_upto]
  dropdown_details = ManageUserRegionDropdownService.get_dropdown_details(channel_code,valid_upto)
  render json: dropdown_details
 end
end
