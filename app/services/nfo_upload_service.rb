class NfoUploadService
  def self.create_nfo_upload_details(data_array)
    db_config = YAML.load_file('config/database.yml')['development']
    conn = OCI8.new(
      db_config['username'],
      db_config['password'],
      db_config['database']
    )
    procedure_name = 'MISVPAY_SAVE_NFO_SALES_DETAILS'
    cursor = conn.parse("BEGIN #{procedure_name}(:P_TRANTYPE, :P_INHOUSENUMBER, :P_TYPE, :P_PLAN,
      :P_PLANDESCRIPTION, :P_FROMSCHEME, :P_FROMPLAN, :P_FROMPLANDESC, :P_AMCCODE, :P_SCHDESC, :P_FOLIONUMBER,
      :P_INVESTORNAME, :P_AMOUNT, :P_AMTINCR, :P_ARNNO, :P_ARNNAME, :P_UFCCODE, :P_UFCNAME, :P_REGION, :P_ZONE, :P_CHANNELNAME,
      :P_MODCHANNEL, :P_SCHEMECODE, :P_BRANCHCODE, :P_PIN, :P_T30B30FLAG, :P_PLATFORM, :P_TRXNDATE, :P_SCHEMEDESCRIPTION,
      :P_MAPRMCODE, :P_RIACODE, :P_ARN_RIA, :P_PLATFORM2, :P_MOBILENUMBER, :P_EMAILID, :P_TYPE2); END;")
    
    data_array.each do |data|
      cursor.bind_param('P_TRANTYPE', data['trn_type'], String)
      cursor.bind_param('P_INHOUSENUMBER', data['inhouse_number'], String)
      cursor.bind_param('P_TYPE', data['type'], String)
      cursor.bind_param('P_PLAN', data['plan'], String)
      cursor.bind_param('P_PLANDESCRIPTION', data['plan_description'], String)
      cursor.bind_param('P_FROMSCHEME', data['from_scheme'], String)
      cursor.bind_param('P_FROMPLAN', data['from_plan'], String)
      cursor.bind_param('P_FROMPLANDESC', data['from_plan_desc'], String)
      cursor.bind_param('P_AMCCODE', data['amc_code'], String)
      cursor.bind_param('P_SCHDESC', data['sch_desc'], String)
      cursor.bind_param('P_FOLIONUMBER', data['folio_number'], String)
      cursor.bind_param('P_INVESTORNAME', data['investor_name'], String)
      cursor.bind_param('P_AMOUNT', data['amount'], String)
      cursor.bind_param('P_AMTINCR', data['amt_incr'], String)
      cursor.bind_param('P_ARNNO', data['arn_no'], String)
      cursor.bind_param('P_ARNNAME', data['arn_name'], String)
      cursor.bind_param('P_UFCCODE', data['ufc_code'], String)
      cursor.bind_param('P_UFCNAME', data['ufc_name'], String)
      cursor.bind_param('P_REGION', data['region'], String)
      cursor.bind_param('P_ZONE', data['zone'], String)
      cursor.bind_param('P_CHANNELNAME', data['channel_name'], String)
      cursor.bind_param('P_MODCHANNEL', data['mod_channel'], String)
      cursor.bind_param('P_SCHEMECODE', data['scheme_code'], String)
      cursor.bind_param('P_BRANCHCODE', data['branch_code'], String)
      cursor.bind_param('P_PIN', data['pin'], String)
      cursor.bind_param('P_T30B30FLAG', data['t30b30flag'], String)
      cursor.bind_param('P_PLATFORM', data['platform'], String)
      cursor.bind_param('P_TRXNDATE', data['trxn_date'], String)
      cursor.bind_param('P_SCHEMEDESCRIPTION', data['scheme_description'], String)
      cursor.bind_param('P_MAPRMCODE', data['map_rmcode'], String)
      cursor.bind_param('P_RIACODE', data['ria_code'], String)
      cursor.bind_param('P_ARN_RIA', data['arn_ria'], String)
      cursor.bind_param('P_PLATFORM2', data['platform2'], String)
      cursor.bind_param('P_MOBILENUMBER', data['mobile_number'], String)
      cursor.bind_param('P_EMAILID', data['email_id'], String)
      cursor.bind_param('P_TYPE2', data['type2'], String)
      cursor.exec
    end
  
    cursor.close
    conn.logoff
  end
end