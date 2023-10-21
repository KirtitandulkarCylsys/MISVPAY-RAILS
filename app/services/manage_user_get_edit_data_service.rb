class  ManageUserGetEditDataService
  def self.edit_data(emp_id,channel_code,emp_role,location,start_date,status)
    db_config = YAML.load_file('config/database.yml')['development']
        conn = OCI8.new(
          db_config['username'],
          db_config['password'],
          db_config['database']
        ) 
     cursor = conn.parse('BEGIN misvpay_manager_user_get_edit_data(:p_emp_id,:p_channel_code, :p_emp_role,:p_location,:p_start_date,:p_status,:get_all_data); END;')
    cursor.bind_param(':p_emp_id', emp_id, String)
    cursor.bind_param(':p_channel_code', channel_code, String)
    cursor.bind_param(':p_emp_role',emp_role , String)
    cursor.bind_param(':p_location', location, String)
    cursor.bind_param(':p_start_date',start_date , String)
    cursor.bind_param(':p_status', status, String)
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
  