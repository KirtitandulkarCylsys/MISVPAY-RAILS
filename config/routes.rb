Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :login_details
      resources :rolewiselogin
      resources :summary_transactions
      resources :mandate_report
      resources :scheme_details
      resources :asset_class
      # resources :region_summary_transactions
      # resources :ufc_summary_transactions
      # resources :rm_summary_transactions


      resources :aum
      resources :etf_sale
      resources :aum_regions
      resources :aum_ufc
      resources :aum_dropdown
      resources :nfo
      post 'nfo_upload', to: 'nfo_upload#create'
      resources :nfo_delete, only: [:destroy]  # Define the DELETE route
      # resources :all_region_retail
      # resources :all_ufc_retail
      # resources :all_rm_retail
      # resources :assetclass
      resources :manage_user_channel_code_dropdown
      resources :manage_user_reporting_role_dropdown
      resources :manage_user_power_user_dropdown
      resources :manage_user_functional_role_dropdown
      resources :manage_user_city_dropdown
      resources :manage_user_select_quarter_dropdown
      resources :manage_user_rh_dropdown
      resources :manage_user_rm_dropdown
      resources :manage_user_quarter_dropdown
      resources :manage_user_rtl_region_query_dropdown
      resources :manage_user_employee_role_dropdown
      resources :manage_user_location_dropdown
      resources :manage_user_zone_dropdown
      resources :manage_user_region_dropdown
      resources :manage_user_ufc_location_dropdown
      resources :search_manage_user_table
      post 'employees', to: 'sp_manage_user_employee_details_save#create'
      put 'employees_update', to: 'manage_user_post_update_data#update'
      resources :manage_user_get_edit_data
      resources :rm_name_dropdown
      resources :region_ufc_scheme_report_search
    end
  end
end
