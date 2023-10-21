class NfoUploadService
  def self.create_nfo_upload_details(data_hash)
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
    
    # Bind parameters from the data_hash
    data_hash.each do |param, value|
      cursor.bind_param("P_#{param.upcase}", value, String)
    end

    cursor.exec
    cursor.close
    conn.logoff
  end
end