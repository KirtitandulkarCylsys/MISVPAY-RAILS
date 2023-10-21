class ManageUserQuarterDropdownService
  def self.get_dropdown_details
    db_config = YAML.load_file('config/database.yml')['development']
        conn = OCI8.new(
          db_config['username'],
          db_config['password'],
          db_config['database']
        ) 
    cursor = conn.parse('BEGIN GET_MANAGE_SELECT_QUARTER_DROPDOWN(:get_all_data); END;')
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
