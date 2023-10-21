class SpManageUserEmployeeDetailsSaveService
  def self.save_employee_data(emp_id,channel_code, emp_role,  location, start_date, end_date, status, remark, valid_from, valid_upto,
     func_role, last_updated_date, last_updated_user, kam_flag,nam_group, region_code,zone, reporting_role, power_user_code, city, emp_name, emp_pass, emailid,
      dv_flag, misvpay_code, sales_flag, fscheme, mail, farn, summit_cat, access_from,
       access_upto, sap_ufc_code, sap_region_code, sap_zone_code, schema, active)
       db_config = YAML.load_file('config/database.yml')['development']
       conn = OCI8.new(
         db_config['username'],
         db_config['password'],
         db_config['database']
       ) 
    cursor = conn.parse('BEGIN SP_MANAGE_USER_EMPLOYEE_DETAILS_SAVE(:p_emp_id, :p_channel_code,:p_emp_role, :p_location, :p_start_date, :p_end_date, :p_status, :p_remark, :p_valid_from, :p_valid_upto, :p_func_role, :p_last_updated_date, :p_last_updated_user, :p_kam_flag,:p_nam_group, :p_region_code, :p_zone, :p_reporting_role, :p_power_user_code, :p_city, :p_emp_name, :p_emp_pass, :p_email, :p_dv_flag, :p_misvpay_code, :p_sales_flag, :p_fscheme, :p_mail, :p_farn, :p_summit_cat, :p_access_from, :p_access_upto, :p_sap_ufc_code, :p_sap_region_code, :p_sap_zone_code, :p_schema, :p_active); END;')

    cursor.bind_param(':p_emp_id', emp_id, String)
    cursor.bind_param(':p_channel_code', channel_code, String)
    cursor.bind_param(':p_emp_role', emp_role, String)
    cursor.bind_param(':p_location', location, String)
    cursor.bind_param(':p_start_date', start_date, String)
    cursor.bind_param(':p_end_date', end_date, String)
    cursor.bind_param(':p_status', status, String)
    cursor.bind_param(':p_remark', remark, String)
    cursor.bind_param(':p_valid_from', valid_from, String)
    cursor.bind_param(':p_valid_upto', valid_upto, String)
    cursor.bind_param(':p_func_role', func_role, String)
    cursor.bind_param(':p_last_updated_date', last_updated_date, String)
    cursor.bind_param(':p_last_updated_user', last_updated_user, String)
    cursor.bind_param(':p_kam_flag', kam_flag, String)
    cursor.bind_param(':p_nam_group', nam_group, String)
    cursor.bind_param(':p_region_code', region_code, String)
    cursor.bind_param(':p_zone', zone, String)
    cursor.bind_param(':p_reporting_role', reporting_role, String)
    cursor.bind_param(':p_power_user_code', power_user_code, String)
    cursor.bind_param(':p_city', city, String)
    cursor.bind_param(':p_emp_name', emp_name, String)
    cursor.bind_param(':p_emp_pass', emp_pass, String)
    cursor.bind_param(':p_email', emailid, String)
    cursor.bind_param(':p_dv_flag', dv_flag, String)
    cursor.bind_param(':p_misvpay_code', misvpay_code, String)
    cursor.bind_param(':p_sales_flag', sales_flag, String)
    cursor.bind_param(':p_fscheme', fscheme, String)
    cursor.bind_param(':p_mail', mail, String)
    cursor.bind_param(':p_farn', farn, String)
    cursor.bind_param(':p_summit_cat', summit_cat, String)
    cursor.bind_param(':p_access_from', access_from, String)
    cursor.bind_param(':p_access_upto', access_upto, String)
    cursor.bind_param(':p_sap_ufc_code', sap_ufc_code, String)
    cursor.bind_param(':p_sap_region_code', sap_region_code, String)
    cursor.bind_param(':p_sap_zone_code', sap_zone_code, String)
    cursor.bind_param(':p_schema', schema, String)
    cursor.bind_param(':p_active', active, String)

    cursor.exec
    cursor.close
    conn.logoff
  end
end

