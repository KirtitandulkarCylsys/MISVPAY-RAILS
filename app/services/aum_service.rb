class AumService
  def self.get_aum_details(empid, emprole, quarter, period_code, zone, region_code, ufc_code, rm_code, chn_code, common_report,page_number,page_size)

    conn = OCI8.new('MISVPAY', 'MISVPAY@123', '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=103.12.1.155)(PORT=1521))(CONNECT_DATA=(SID=xe)))')

    procedure_name = 'NEWMISVPAY_TEST_AUM_REPORT_ALL_260923'

    cursor = conn.parse("BEGIN #{procedure_name}(:P_EMPLID, :P_EMPROLE, :P_QUARTER, :P_PERIOD_CODE, :P_ZONE, :P_REGION_CODE, :P_UFC_CODE, :P_RMCODE, :P_CHN_Code, :P_COMMON_REPORT, :P_PAGE_NUMBER, :P_PAGE_SIZE, :get_all_data); END;")

    cursor.bind_param(':P_EMPLID', empid, String)

    cursor.bind_param(':P_EMPROLE', emprole, String)

    cursor.bind_param(':P_QUARTER', quarter, String)

    cursor.bind_param(':P_PERIOD_CODE', period_code, String)

    cursor.bind_param(':P_ZONE', zone, String)

    cursor.bind_param(':P_REGION_CODE', region_code, String)

    cursor.bind_param(':P_UFC_CODE', ufc_code, String)

    cursor.bind_param(':P_RMCODE', rm_code, String)

    cursor.bind_param(':P_CHN_Code', chn_code, String)

    cursor.bind_param(':P_COMMON_REPORT', common_report, String)
    
    cursor.bind_param(':P_PAGE_NUMBER', page_number, String)

    cursor.bind_param(':P_PAGE_SIZE', page_size, String)



 

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