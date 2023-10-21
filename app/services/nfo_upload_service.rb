class NfoUploadService
    def self.get_nfo_upload_details(trn_type,inhouse_number,type,plan,plan_description,from_scheme,from_plan,from_plan_desc,amc_code,sch_desc,folio_number,investor_name,amount,amt_incr,arn_no,arn_name,ufc_code,ufc_name,region,zone,channel_name,mod_channel,scheme_code, branch_code,pin,t30b30flag,platform,trxn_date,scheme_description,map_rmcode,ria_code,arn_ria,platform2,mobile_number,email_id,type2)
      db_config = YAML.load_file('config/database.yml')['development'] 
      conn = OCI8.new(
        db_config['username'],
        db_config['password'],
        db_config['database'] 
      )      
      procedure_name = 'MISVPAY_SAVE_NFO_SALES_DETAILS'
      cursor = conn.parse("BEGIN #{procedure_name}(:P_TRANTYPE,:P_INHOUSENUMBER,:P_TYPE,:P_PLAN,
        :P_PLANDESCRIPTION,:P_FROMSCHEME,:P_FROMPLAN,:P_FROMPLANDESC,:P_AMCCODE,:P_SCHDESC,:P_FOLIONUMBER,
        :P_INVESTORNAME,:P_AMOUNT,:P_AMTINCR,:P_ARNNO,:P_ARNNAME,:P_UFCCODE,:P_UFCNAME,:P_REGION,:P_ZONE,:P_CHANNELNAME,
        :P_MODCHANNEL,:P_SCHEMECODE,:P_BRANCHCODE,:P_PIN,:P_T30B30FLAG,:P_PLATFORM,:P_TRXNDATE,:P_SCHEMEDESCRIPTION,
        :P_MAPRMCODE,:P_RIACODE,:P_ARN_RIA,:P_PLATFORM2,:P_MOBILENUMBER,:P_EMAILID,:P_TYPE2); END;")
      cursor.bind_param(':P_TRANTYPE', trn_type, String)
      cursor.bind_param(':P_INHOUSENUMBER', inhouse_number, String)
      cursor.bind_param(':P_TYPE', type, String)
      cursor.bind_param(':P_PLAN', plan, String)
      cursor.bind_param(':P_PLANDESCRIPTION', plan_description, String)
      cursor.bind_param(':P_FROMSCHEME', from_scheme, String)
      cursor.bind_param(':P_FROMPLAN', from_plan, String)
      cursor.bind_param(':P_FROMPLANDESC', from_plan_desc, String)
      cursor.bind_param(':P_AMCCODE', amc_code, String)
      cursor.bind_param(':P_SCHDESC', sch_desc, String)
      cursor.bind_param(':P_FOLIONUMBER', folio_number, String)
      cursor.bind_param(':P_INVESTORNAME', investor_name, String)
      cursor.bind_param(':P_AMOUNT', amount, String)
      cursor.bind_param(':P_AMTINCR', amt_incr, String)
      cursor.bind_param(':P_ARNNO', arn_no, String)
      cursor.bind_param(':P_ARNNAME', arn_name, String)
      cursor.bind_param(':P_UFCCODE', ufc_code, String)
      cursor.bind_param(':P_UFCNAME', ufc_name, String)
      cursor.bind_param(':P_REGION', region, String)
      cursor.bind_param(':P_ZONE', zone, String)
      cursor.bind_param(':P_CHANNELNAME', channel_name, String)
      cursor.bind_param(':P_MODCHANNEL', mod_channel, String)
      cursor.bind_param(':P_SCHEMECODE', scheme_code, String)
      cursor.bind_param(':P_BRANCHCODE', branch_code, String)
      cursor.bind_param(':P_PIN', pin, String)
      cursor.bind_param(':P_T30B30FLAG', t30b30flag, String)
      cursor.bind_param(':P_PLATFORM', platform, String)
      cursor.bind_param(':P_TRXNDATE', trxn_date, String)
      cursor.bind_param(':P_SCHEMEDESCRIPTION', scheme_description, String)
      cursor.bind_param(':P_MAPRMCODE', map_rmcode, String)
      cursor.bind_param(':P_RIACODE', ria_code, String)
      cursor.bind_param(':P_ARN_RIA', arn_ria, String)
      cursor.bind_param(':P_PLATFORM2', platform2, String)
      cursor.bind_param(':P_MOBILENUMBER', mobile_number, String)
      cursor.bind_param(':P_EMAILID', email_id, String)
      cursor.bind_param(':P_TYPE2', type2, String)

        
    cursor.exec
    cursor.close
    conn.logoff
      
    end
end
    