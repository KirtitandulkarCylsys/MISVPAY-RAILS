require 'oci8'
class ArnService
  def self.get_arn_report(employee_id,emprole,start_date, end_date,quarter,quarter_last_date, multicity,zone, region, ufc, rm, select_type, channel)
  	db_config = YAML.load_file('config/database.yml')['development']
    conn = OCI8.new(
      db_config['username'],
      db_config['password'],
      db_config['database']
    )    
    select_column = (select_type == 'grosssales') ? 'grosssales' : 'netsales'
    procedure_name = 'MISVPAY_RTL_TRANSACTION_SUMMARY_ARN_REPORT_SP'
    
    cursor = conn.parse("BEGIN #{procedure_name}(:P_EMPLID,:P_EMPROLE,:P_STARTDATE,:P_ENDDATE, :p_quarter,  :p_quarter_last_date, :p_multicity, :P_ZONE, :P_REGION_CODE, :P_UFC_CODE, :P_RMCODE, :p_report_type, :P_CHN_CODE,:get_all_data); END;")
		
    cursor.bind_param(':P_EMPLID', employee_id, String)
    cursor.bind_param(':P_EMPROLE', emprole, String)
    cursor.bind_param(':P_STARTDATE', start_date, String)
    cursor.bind_param(':P_ENDDATE',end_date , String)
    cursor.bind_param(':p_quarter', quarter, String)
    cursor.bind_param(':p_quarter_last_date', quarter_last_date, String)    
    cursor.bind_param(':p_multicity', multicity, String)
    cursor.bind_param(':P_ZONE', zone, String)
    cursor.bind_param(':P_REGION_CODE', region, String)
    cursor.bind_param(':P_UFC_CODE', ufc, String)
    cursor.bind_param(':P_RMCODE', rm, String)
    cursor.bind_param(':p_report_type', select_type, String)
    cursor.bind_param(':P_CHN_CODE', channel, String)
    cursor.bind_param(':get_all_data', nil, OCI8::Cursor)
    cursor.exec
    
    arn_report = []
    out_cursor = cursor[':get_all_data']
    columns = out_cursor.column_metadata
    
    out_cursor.fetch do |row|
      arn_row = {}
      columns.each_with_index do |column, idx|
        arn_row[column.name.upcase] = row[idx]
      end
      arn_report << arn_row
    end

    out_cursor.close
     cursor.close
    conn.logoff

    arn_report
  end
end


