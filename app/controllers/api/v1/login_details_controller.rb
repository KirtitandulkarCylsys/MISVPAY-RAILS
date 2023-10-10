require 'oci8'
class Api::V1::LoginDetailsController < ApplicationController
  # before_action :find_user, except: %i[create index]

  
  def index       
    user_details = LoginDetailsService.get_user_details(p_emp_id, p_auth_token)
    render json: user_details
  end

  def create
    auth_token = JsonWebToken.encode(p_emp_id)  
    user_details = LoginDetailsService.get_user_details(p_emp_id, auth_token)  
    render json: user_details, status: :ok
  end

  private
  def p_emp_id
    params[:p_emp_id]
  end

  def p_auth_token
    JsonWebToken.encode(p_emp_id)
  end

end