class LoginDetailsService

  def self.get_user_details(p_emp_id, p_auth_token)
    conn = OCI8.new('MISVPAY', 'MISVPAY@123', '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=103.12.1.155)(PORT=1521))(CONNECT_DATA=(SID=xe)))')
    cursor = conn.parse('BEGIN sp_misvpay_get_user_login_details(:p_emp_id, :p_auth_token, :get_user_login_details); END;')
    cursor.bind_param(':p_emp_id', p_emp_id, String)  
    cursor.bind_param(':p_auth_token', p_auth_token, String)  
    cursor.bind_param(':get_user_login_details', nil, OCI8::Cursor)  
    user_details = []
    begin
      cursor.exec
      result_cursor = cursor[':get_user_login_details']
      while row = result_cursor.fetch do
        user_details << { p_emp_id: row[1], p_auth_token: row[2] }
      end      
      result_cursor.close
    rescue StandardError => e
      puts "Error while fetching data: #{e.message}"
    ensure
      cursor.close
      conn.logoff
    end
    return user_details
  end

end