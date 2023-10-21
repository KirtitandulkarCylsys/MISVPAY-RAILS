class  AssetDropdownServices
    def self.get_asset_dropdown
      db_config = YAML.load_file('config/database.yml')['development']
      conn = OCI8.new(
      db_config['username'],
      db_config['password'],
      db_config['database']
    )    
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
    