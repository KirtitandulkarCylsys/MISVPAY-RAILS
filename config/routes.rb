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
      # resources :all_region_retail
      # resources :all_ufc_retail
      # resources :all_rm_retail
      # resources :assetclass
    end
  end
end
