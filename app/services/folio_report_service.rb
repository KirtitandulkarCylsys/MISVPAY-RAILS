class FolioReportService
    def self.folio_details(empid, emprole,quarter,zone, region_code, ufc_code, rm_code,period_code,report_type,channel_code)
      
      db_config = YAML.load_file('config/database.yml')['development']
      conn = OCI8.new(
        db_config['username'],
        db_config['password'],
        db_config['database']
      )
      procedure_name = 'MISVPAY_TOP_100_FOLIO_REPORTS_SP'
      cursor = conn.parse("BEGIN #{procedure_name}(:P_EMPLID, :P_EMPROLE,:P_QUARTER,:P_ZONE, :P_REGION_CODE, :P_UFC_CODE, :P_RMCODE,:P_PERIOD_CODE,:p_report_type,:P_CHN_CODE,:get_all_data); END;")
      cursor.bind_param(':P_EMPLID', empid, String)
      cursor.bind_param(':P_EMPROLE', emprole, String)
      cursor.bind_param(':P_QUARTER', quarter, String)
      cursor.bind_param(':P_ZONE', zone, String)
      cursor.bind_param(':P_REGION_CODE', region_code, String)
      cursor.bind_param(':P_UFC_CODE', ufc_code, String)
      cursor.bind_param(':P_RMCODE', rm_code, String)
      cursor.bind_param(':P_PERIOD_CODE', period_code, String)
      cursor.bind_param(':p_report_type', report_type, String)
      cursor.bind_param(':P_CHN_CODE', channel_code, String)
      cursor.bind_param(':get_all_data', nil, OCI8::Cursor)
      cursor.exec
      aum_report = []
      out_cursor = cursor[':get_all_data']
      columns = out_cursor.column_metadata
      out_cursor.fetch do |row|
        aum_row = {}
        columns.each_with_index do |column, idx|
          aum_row[column.name.upcase] = row[idx]
        end
        aum_report << aum_row
      end
      out_cursor.close
      cursor.close
      conn.logoff
      aum_report
    end
  end