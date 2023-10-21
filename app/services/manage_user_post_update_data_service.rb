class ManageUserPostUpdateDataService
    def self.update_employee_data(emp_id,channel_code, emp_role,  location, start_date, status, reporting_role, power_user_code, zone, region_code,
        kam_flag, nam_group, func_role, city,end_date, dv_flag,remark, valid_from,valid_upto, access_from, access_upto, emp_name, emp_pass, emailid)
        db_config = YAML.load_file('config/database.yml')['development']
        conn = OCI8.new(
          db_config['username'],
          db_config['password'],
          db_config['database']
        ) 
      cursor = conn.parse('BEGIN misvpay_manager_user_update_data(:p_emp_id, :p_channel_code,:p_emp_role, :p_location, :p_start_date,:p_status, :p_reporting_role, :p_power_user_code,
       :p_zone, :p_region_code, :p_kam_flag, :p_nam_group, :p_fun_role,:p_city, :p_end_date, :p_dv_flag, :p_remark, :p_valid_from, :p_valid_upto, :p_access_from, :p_access_upto, :p_emp_name, :p_emp_pass, :p_email); END;')
  
      cursor.bind_param(':p_emp_id', emp_id, String)
      cursor.bind_param(':p_channel_code', channel_code, String)
      cursor.bind_param(':p_emp_role', emp_role, String)
      cursor.bind_param(':p_location', location, String)
      cursor.bind_param(':p_start_date', start_date, String)
      cursor.bind_param(':p_status', status, String)
      cursor.bind_param(':p_reporting_role', reporting_role, String)
      cursor.bind_param(':p_power_user_code', power_user_code, String)
      cursor.bind_param(':p_zone', zone, String)
      cursor.bind_param(':p_region_code', region_code, String)
      cursor.bind_param(':p_kam_flag', kam_flag, String)
      cursor.bind_param(':p_nam_group', nam_group, String)
      cursor.bind_param(':p_fun_role', func_role, String)
      cursor.bind_param(':p_city', city, String)
      cursor.bind_param(':p_end_date', end_date, String)
      cursor.bind_param(':p_dv_flag', dv_flag, String)
      cursor.bind_param(':p_remark', remark, String)
      cursor.bind_param(':p_valid_from', valid_from, String)
      cursor.bind_param(':p_valid_upto', valid_upto, String)
      cursor.bind_param(':p_access_from', access_from, String)
      cursor.bind_param(':p_access_upto', access_upto, String)
      cursor.bind_param(':p_emp_name', emp_name, String)
      cursor.bind_param(':p_emp_pass', emp_pass, String)
      cursor.bind_param(':p_email', emailid, String)

      cursor.exec
      cursor.close
      conn.logoff
    end
  end
  
  