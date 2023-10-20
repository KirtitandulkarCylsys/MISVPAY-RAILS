class Api::V1::SchemeDetailsController < ApplicationController
  def index
    asset_class = params[:asset_class]
    scheme_detail = SchemeService.get_scheme_details(asset_class)
    render json: scheme_detail
  end
end