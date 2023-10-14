class Api::V1::AccountDropdownController < ApplicationController
    def index
        account_dropdown = AccountUfcDropdownService.get_account_dropdown
      render json: account_dropdown
  end
    
end
