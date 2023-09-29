require 'oci8'
class SummaryTransactionService
  def self.get_transaction_summary_report(employee_id,emprole, quarter,start_date, end_date,  select_type,  scheme_code, channel, zone, region, ufc, rm, common_report)
    conn = OCI8.new('MISVPAY', 'MISVPAY@123', '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=103.12.1.155)(PORT=1521))(CONNECT_DATA=(SID=xe)))')
    select_column = (select_type == 'grosssales') ? 'grosssales' : 'netsales'
    procedure_name = 'newmisvpay_transaction_summary_report_all'
    
    cursor = conn.parse("BEGIN #{procedure_name}(:p_emplid,:p_emprole,:p_quarter,:p_start_date, :p_end_date,  :p_report_type, :p_scheme_code, :p_chn_code, :p_zone, :p_region_code, :p_ufc_code, :p_rmcode, :p_common_report, :get_all_data); END;")
    cursor.bind_param(':p_emplid', employee_id, String)
    cursor.bind_param(':p_emprole', emprole, String)
    cursor.bind_param(':p_quarter', quarter, String)
    cursor.bind_param(':p_start_date', start_date, String)
    cursor.bind_param(':p_end_date', end_date, String)
    cursor.bind_param(':p_report_type', select_type, String)    
    cursor.bind_param(':p_scheme_code', scheme_code, String)
    cursor.bind_param(':p_chn_code', channel, String)
    cursor.bind_param(':p_zone', zone, String)
    cursor.bind_param(':p_region_code', region, String)
    cursor.bind_param(':p_ufc_code', ufc, String)
    cursor.bind_param(':p_rmcode', rm, String)
    cursor.bind_param(':p_common_report', common_report, String)
    cursor.bind_param(':get_all_data', nil, OCI8::Cursor)
    cursor.exec
    
    summary_report = []
    out_cursor = cursor[':get_all_data']
    columns = out_cursor.column_metadata
    
    out_cursor.fetch do |row|
      summary_row = {}
      columns.each_with_index do |column, idx|
        summary_row[column.name.upcase] = row[idx]
      end
      summary_report << summary_row
    end

    out_cursor.close
    cursor.close
    conn.logoff

    summary_report
  end
end