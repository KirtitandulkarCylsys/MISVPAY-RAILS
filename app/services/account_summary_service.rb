require 'oci8'

class AccountSummaryService
    def self.get_account_summary_report_rm(employee_id,employee_role,
      quarter,start_date, end_date, amount, condition, transaction_type, ufc,zone,region_code,ufc_code,rmcode,no_mapping,channel_code,common_report)
      conn = OCI8.new('MISVPAY', 'MISVPAY@123', '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=103.12.1.155)(PORT=1521))(CONNECT_DATA=(SID=xe)))')
      procedure_name = 'amount_report_sales'
      cursor = conn.parse("BEGIN #{procedure_name}(:P_EMPLID, :p_emprole,:p_quarter, :p_startDate,:p_endDate,:p_amount,:P_condition,:p_transation_type, :p_ufc,:p_zone,:P_REGION_CODE,:p_ufc_code,:P_RMCODE,:p_no_mapping,:P_CHN_Code,:P_COMMON_REPORT, :get_all_data); END;")
      cursor.bind_param(':P_EMPLID',employee_id, String)
      cursor.bind_param(':p_emprole',employee_role, String)
      cursor.bind_param(':p_quarter',quarter, String)
      cursor.bind_param(':p_startDate', start_date, String)
      cursor.bind_param(':p_endDate', end_date, String)
      cursor.bind_param(':p_amount', amount, String)
      cursor.bind_param(':P_condition', condition, String)
      cursor.bind_param(':p_transation_type', transaction_type, String)
      cursor.bind_param(':p_ufc',ufc, String)
      cursor.bind_param(':p_zone',zone, String)
      cursor.bind_param(':P_REGION_CODE',region_code, String)
      cursor.bind_param(':p_ufc_code',ufc_code, String)
      cursor.bind_param(':P_RMCODE',rmcode, String)
      cursor.bind_param(':p_no_mapping',no_mapping, String)
      cursor.bind_param(':P_CHN_Code',channel_code, String)
      cursor.bind_param(':P_COMMON_REPORT',common_report, String)
      cursor.bind_param(':get_all_data', nil, OCI8::Cursor)    
      cursor.exec
      sales_report = []
      out_cursor = cursor[':get_all_data']
      columns = out_cursor.column_metadata
          out_cursor.fetch do |row|
            sales_row = {}
          columns.each_with_index do |column, idx|
            sales_row[column.name.upcase] = row[idx]
          end
          sales_report << sales_row
      end
      out_cursor.close
      cursor.close
      conn.logoff
      sales_report
    end
  end
  