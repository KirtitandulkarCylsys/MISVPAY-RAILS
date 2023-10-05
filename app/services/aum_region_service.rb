class AumRegionService
    def self.get_aum_region_details(report_period, zone)
      conn = OCI8.new('MISVPAY', 'MISVPAY@123', '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=103.12.1.155)(PORT=1521))(CONNECT_DATA=(SID=xe)))')
      procedure_name = 'sp_misvpay_get_aum_based_reports_region_wise'
      cursor = conn.parse("BEGIN #{procedure_name}(:p_report_period,:p_zone, :get_all_data); END;")
      cursor.bind_param(':p_report_period', report_period, String)
      cursor.bind_param(':p_zone', zone, String)
      cursor.bind_param(':get_all_data', nil, OCI8::Cursor)    
      cursor.exec
      aum_region_report = []
      out_cursor = cursor[':get_all_data']
      columns = out_cursor.column_metadata
          out_cursor.fetch do |row|
          region_row = {}
          columns.each_with_index do |column, idx|
            region_row[column.name.upcase] = row[idx]
          end
          aum_region_report << region_row
       end
       out_cursor.close
       cursor.close
       conn.logoff
       aum_region_report
    end
  end
  