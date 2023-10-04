class RolewiseLoginService
	def self.get_user_details(emp_id, current_date,quarter_no)
    conn = OCI8.new('MISVPAY', 'MISVPAY@123', '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=103.12.1.155)(PORT=1521))(CONNECT_DATA=(SID=xe)))')
    cursor = conn.parse('BEGIN MISVPAY_USER_LOGIN_DETAILS(:P_EMPLID, :P_CURRENT_DATE,:p_quarter_no, :get_all_data); END;')
    cursor.bind_param(':P_EMPLID', emp_id, String)  
    cursor.bind_param(':P_CURRENT_DATE', current_date, String)
    cursor.bind_param(':p_quarter_no', quarter_no, String)  
    cursor.bind_param(':get_all_data', nil, OCI8::Cursor)  
    cursor.exec
    login_report = []
    out_cursor = cursor[':get_all_data']
    columns = out_cursor.column_metadata
    out_cursor.fetch do |row|
      login_row = {}
      columns.each_with_index do |column, idx|
        login_row[column.name.upcase] = row[idx]
      end
      login_report << login_row
    end
    out_cursor.close
    cursor.close
    conn.logoff
    login_report

  end
end