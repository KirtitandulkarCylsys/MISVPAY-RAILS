class NfoSalesService
  def self.get_nfo_sales_details(emp_id, emprole,zone,region,ufc,rm)
    conn = OCI8.new('MISVPAY', 'MISVPAY@123', '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=103.12.1.155)(PORT=1521))(CONNECT_DATA=(SID=xe)))')
    procedure_name = 'MISVPAY_NFO_SALES_DETAILS_SP'
    cursor = conn.parse("BEGIN #{procedure_name}(:P_EMPLID,:P_EMPROLE,:P_ZONE,:P_REGION_CODE,:P_UFC_CODE, :P_RMCODE, :get_all_data); END;")
    cursor.bind_param(':P_EMPLID', emp_id, String)
    cursor.bind_param(':P_EMPROLE', emprole, String)
    cursor.bind_param(':P_ZONE', zone, String)
    cursor.bind_param(':P_REGION_CODE', region, String)
    cursor.bind_param(':P_UFC_CODE', ufc, String)
    cursor.bind_param(':P_RMCODE', rm, String)
 
    cursor.bind_param(':get_all_data', nil, OCI8::Cursor)    
    cursor.exec
    nfo_report = []
    out_cursor = cursor[':get_all_data']
    columns = out_cursor.column_metadata
    out_cursor.fetch do |row|
      nfo_row = {}
        columns.each_with_index do |column, idx|
          nfo_row[column.name.upcase] = row[idx]
        end
      nfo_report << nfo_row
    end
    out_cursor.close
    cursor.close
  	conn.logoff
    nfo_report
  end
end
  