class Api::V1::AumDropdownController < ApplicationController
    def index
      dropdown_details = AumDropdownService.get_dropdown_details
      render json: dropdown_details
    end
  end