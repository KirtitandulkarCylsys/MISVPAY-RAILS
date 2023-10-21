require 'oci8'
class MandateReportService
  def self.get_mandate_report(empid, emp_role, year_quater, start_date, end_date, stype, status, scheme_code, chn_code, zone, region_code, ufc_code, rmcode, common_report)
    db_config = YAML.load_file('config/database.yml')['development']
    conn = OCI8.new(
      db_config['username'],
      db_config['password'],
      db_config['database']
    )    
    # select_column = (stype == 'SIP') ? 'SIP' : 'STP'
    # procedure_name = 'NEWMISVPAY_MANDATE_REPORT_FOR_ALL' 
    
    cursor = conn.parse("BEGIN NEWMISVPAY_MANDATE_REPORT_FOR_ALL(:P_EMPLID, :P_EMPROLE, :P_QUARTER, :P_START_DATE, :P_END_DATE, :P_S_TYPE, :P_STATUS, :P_SCHEME_CODE, :P_CHN_CODE, :P_ZONE, :P_REGION_CODE, :P_UFC_CODE, :P_RMCODE, :P_COMMON_REPORT, :get_all_data); END;")
    cursor.bind_param(':P_EMPLID', empid, String)
    cursor.bind_param(':P_EMPROLE', emp_role, String)
    cursor.bind_param(':P_QUARTER', year_quater, String)
    cursor.bind_param(':P_START_DATE', start_date, String)
    cursor.bind_param(':P_END_DATE', end_date, String)
    cursor.bind_param(':P_S_TYPE', stype, String)
    cursor.bind_param(':P_STATUS', status, String)
    cursor.bind_param(':P_SCHEME_CODE', scheme_code, String)
    cursor.bind_param(':P_CHN_CODE', chn_code, String)
    cursor.bind_param(':P_ZONE', zone, String)
    cursor.bind_param(':P_REGION_CODE', region_code, String)
    cursor.bind_param(':P_UFC_CODE', ufc_code, String)
    cursor.bind_param(':P_RMCODE', rmcode, String)
    cursor.bind_param(':P_COMMON_REPORT', common_report, String)
    cursor.bind_param(':get_all_data', nil, OCI8::Cursor)
    cursor.exec
    
    mandate_summary_report = []
    out_cursor = cursor[':get_all_data']
    columns = out_cursor.column_metadata
    
    out_cursor.fetch do |row|
      mandate_row = {}
      columns.each_with_index do |column, idx|
        mandate_row[column.name.upcase] = row[idx]
      end
      mandate_summary_report << mandate_row
    end

    out_cursor.close
    cursor.close
    conn.logoff

    mandate_summary_report
  end
end
