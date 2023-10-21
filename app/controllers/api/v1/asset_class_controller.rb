class Api::V1::AssetClassController < ApplicationController
  def index
    asset_dropdown = AssetDropdownServices.get_asset_dropdown
    render json: asset_dropdown
  end
end
    
