class  AssetDropdownServices
    def self.get_asset_dropdown
      conn = OCI8.new('MISVPAY', 'MISVPAY@123', '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=103.12.1.155)(PORT=1521))(CONNECT_DATA=(SID=xe)))')
      cursor = conn.parse('BEGIN GET_Asset_Class_DROP_DOWN_DATA(:get_all_data); END;')
      cursor.bind_param(':get_all_data', nil, OCI8::Cursor)
      cursor.exec
      asset_data = []
      out_cursor = cursor[':get_all_data']
      columns = out_cursor.column_metadata
      
      out_cursor.fetch do |row|
        asset_row = {}
        columns.each_with_index do |column, idx|
            asset_row[column.name.upcase] = row[idx]
        end
        asset_data << asset_row
      end
  
      out_cursor.close
      cursor.close
      conn.logoff
      asset_data
    end
  end  
    