class  ManageUserGetEditDataService
    def self.update_data(emp_id,channel_code,emp_role,location,start_date,status)
      conn = OCI8.new('MISVPAY', 'MISVPAY@123', '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=103.12.1.155)(PORT=1521))(CONNECT_DATA=(SID=xe)))')
      cursor = conn.parse('BEGIN misvpay_manager_user_get_edit_data( :p_emp_id,:p_channel_code,:p_emp_role,:p_location,:p_start_date,:p_status); END;')
      cursor.bind_param(':p_emp_id', emp_id, String)
      cursor.bind_param(':p_channel_code', channel_code, String)
      cursor.bind_param(':p_emp_role', emp_role, String)
      cursor.bind_param(':p_location', location, String)
      cursor.bind_param(':p_start_date', start_date, String)
      cursor.bind_param(':p_status', status, String)
      
      cursor.exec
  
      cursor.close
      conn.logoff
    end
  end  
  