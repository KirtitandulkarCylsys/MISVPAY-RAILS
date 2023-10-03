class ManageUserReportingRoleDropdownService
  def self.get_dropdown_details
    conn = OCI8.new('MISVPAY', 'MISVPAY@123', '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=103.12.1.155)(PORT=1521))(CONNECT_DATA=(SID=xe)))')
    cursor = conn.parse('BEGIN GET_MANAGE_USER_REPORTING_ROLES_DROPDOWN(:get_all_data); END;')
    cursor.bind_param(':get_all_data', nil, OCI8::Cursor)
    cursor.exec
    dropdown_data = []
    out_cursor = cursor[':get_all_data']
    columns = out_cursor.column_metadata
      
    out_cursor.fetch do |row|
      dropdown_row = {}
      columns.each_with_index do |column, idx|
        dropdown_row[column.name.upcase] = row[idx]
      end
      dropdown_data <<  dropdown_row
    end
  
    out_cursor.close
    cursor.close
    conn.logoff
    dropdown_data
  end
end
