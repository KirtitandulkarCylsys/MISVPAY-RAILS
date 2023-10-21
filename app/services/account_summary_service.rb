require 'oci8'
class AccountSummaryService
    def self.get_account_summary_report_rm(
      employee_id,
      employee_role,
      quarter,
      account_no,
      pan_no,
      pin_code,
      arn_no,
      subARN_no,
      ufc,
      amount,
      condition,
      karvy_location,
      start_date,
      end_date, 
      scheme_code,
      ria_code,
      trans_RM_code,
      ihno,
      scheme_type,
      euin,
      transaction_type,
      bsf,
      no_mapping,
      zone,
      region_code,
      ufc_code,
      rmcode,
      channel_code,
      common_report)
      db_config = YAML.load_file('config/database.yml')['development']
      conn = OCI8.new(
        db_config['username'],
        db_config['password'],
        db_config['database']
      )
      procedure_name = 'MISVPAY_AMOUNT_SUMMARY_REPORT'
      cursor = conn.parse("BEGIN #{procedure_name}(
        :P_EMPLID,  
        :P_EMPROLE,  
        :P_QUARTER,  
        :P_ACCOUNT_NO,  
        :P_PAN_NO,  
        :P_PIN_CODE,  
        :P_ARN_NO,  
        :P_SUBARN_NO, 
        :P_UFC,  
        :P_AMOUNT,  
        :P_CONDITION,  
        :P_KARVY_LOCATION,  
        :P_STARTDATE, 
        :P_ENDDATE,  
        :P_SCHEME_CODE,  
        :P_RIA_CODE,  
        :P_TRANS_RM_CODE,  
        :P_IHNO,  
        :P_SCHEME_TYPE,  
        :P_EUIN,  
        :P_TRANSATION_TYPE,  
        :P_BSF ,
        :P_NO_MAPPING,  
        :P_ZONE,  
        :P_REGION_CODE,  
        :P_UFC_CODE,  
        :P_RMCODE,  
        :P_CHN_CODE,
        :P_COMMON_REPORT, 
        :get_all_data); END;")
      cursor.bind_param(':P_EMPLID',employee_id, String)
      cursor.bind_param(':P_EMPROLE',employee_role, String)
      cursor.bind_param(':P_QUARTER',quarter, String)
      cursor.bind_param(':P_ACCOUNT_NO',account_no, String)
      cursor.bind_param(':P_PAN_NO',pan_no, String)
      cursor.bind_param(':P_PIN_CODE',pin_code, String)
      cursor.bind_param(':P_ARN_NO',arn_no, String)
      cursor.bind_param(':P_SUBARN_NO',subARN_no, String)
      cursor.bind_param(':P_UFC',ufc, String)
      cursor.bind_param(':P_AMOUNT', amount, String)
      cursor.bind_param(':P_CONDITION', condition, String)
      cursor.bind_param(':P_KARVY_LOCATION',karvy_location, String)
      cursor.bind_param(':P_STARTDATE', start_date, String)
      cursor.bind_param(':P_ENDDATE', end_date, String)
      cursor.bind_param(':P_SCHEME_CODE',scheme_code, String)
      cursor.bind_param(':P_RIA_CODE', ria_code, String)
      cursor.bind_param(':P_TRANS_RM_CODE', trans_RM_code, String)
      cursor.bind_param(':P_IHNO', ihno, String)
      cursor.bind_param(':P_SCHEME_TYPE', scheme_type, String)
      cursor.bind_param(':P_EUIN', euin, String)
      cursor.bind_param(':P_TRANSATION_TYPE', transaction_type, String)
      cursor.bind_param(':P_BSF', bsf, String)
      cursor.bind_param(':P_NO_MAPPING',no_mapping, String)
      cursor.bind_param(':P_ZONE',zone, String)
      cursor.bind_param(':P_REGION_CODE',region_code, String)
      cursor.bind_param(':P_UFC_CODE',ufc_code, String)
      cursor.bind_param(':P_RMCODE',rmcode, String)
      cursor.bind_param(':P_CHN_CODE',channel_code, String)
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
  