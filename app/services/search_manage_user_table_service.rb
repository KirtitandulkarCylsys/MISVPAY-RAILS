class SearchManageUserTableService
    def self.get_dropdown_details(emp_id,emp_name,channel_code,emp_role,status,location)
      db_config = YAML.load_file('config/database.yml')['development']
        conn = OCI8.new(
          db_config['username'],
          db_config['password'],
          db_config['database']
        ) 
      cursor = conn.parse('BEGIN MISVPAY_MANAGER_USER_FOR_GET_DATA(:empid_in,:emp_name_in, :channelcode_in,:emprole_in,:status_in,:location_in,:get_all_data); END;')
      cursor.bind_param(':empid_in', emp_id, String)
      cursor.bind_param(':emp_name_in', emp_name, String)
      cursor.bind_param(':channelcode_in', channel_code, String)
      cursor.bind_param(':emprole_in', emp_role, String)
      cursor.bind_param(':status_in', status, String)
      cursor.bind_param(':location_in', location, String)
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
