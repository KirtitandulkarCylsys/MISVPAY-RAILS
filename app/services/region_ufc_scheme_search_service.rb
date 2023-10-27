class RegionUfcSchemeReportSearchService
    def self.get_dropdown_details(emp_id,emp_role,quarter,start_date,end_date,zone,region_code,ufc_code,rm_code,channel_code)
      db_config = YAML.load_file('config/database.yml')['development']
        conn = OCI8.new(
          db_config['username'],
          db_config['password'],
          db_config['database']
        ) 
      cursor = conn.parse('BEGIN MISVPAY_REGION_UFC_SCHEME_REPORT_SP(:P_EMPLID,:P_EMPROLE, :P_QUARTER,:P_STARTDATE,:P_ENDDATE,
      :P_ZONE,:P_REGION_CODE,:P_UFC_CODE,:P_RMCODE,:P_CHN_CODE,:get_all_data); END;')
      cursor.bind_param(':P_EMPLID', emp_id, String)
      cursor.bind_param(':P_EMPROLE', emp_role, String)
      cursor.bind_param(':P_QUARTER',quarter , String)
      cursor.bind_param(':P_STARTDATE',start_date , String)
      cursor.bind_param(':P_ENDDATE', end_date, String)
      cursor.bind_param(':P_ZONE', zone, String)
      cursor.bind_param(':P_REGION_CODE', region_code, String)
      cursor.bind_param(':P_UFC_CODE', ufc_code, String)
      cursor.bind_param(':P_RMCODE', rm_code, String)
      cursor.bind_param(':P_CHN_CODE', channel_code, String)
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
