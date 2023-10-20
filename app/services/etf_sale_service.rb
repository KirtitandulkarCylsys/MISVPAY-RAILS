class EtfSaleService
    def self.etfsale_details(empid, emprole,start_date, end_date, zone, region_code, ufc_code, rm_code)
  
      conn = OCI8.new('MISVPAY', 'MISVPAY@123', '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=103.12.1.155)(PORT=1521))(CONNECT_DATA=(SID=xe)))')
  
      procedure_name = 'MISVPAY_ETF_SALES_DETAILS_SP'
  
      cursor = conn.parse("BEGIN #{procedure_name}(:P_EMPLID, :P_EMPROLE,:P_START_DATE, :P_END_DATE,:P_ZONE, :P_REGION_CODE, :P_UFC_CODE, :P_RMCODE,:get_all_data); END;")
  
      cursor.bind_param(':P_EMPLID', empid, String)
  
      cursor.bind_param(':P_EMPROLE', emprole, String)
  
      cursor.bind_param(':P_START_DATE', start_date, String)
      cursor.bind_param(':P_END_DATE', end_date, String)
      cursor.bind_param(':P_ZONE', zone, String)
  
      cursor.bind_param(':P_REGION_CODE', region_code, String)
  
      cursor.bind_param(':P_UFC_CODE', ufc_code, String)
  
      cursor.bind_param(':P_RMCODE', rm_code, String)
  
     
  
  
  
   
  
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