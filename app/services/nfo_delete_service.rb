class NfoDeleteService
  def self.nfo_delete_details(emp_id, emprole,zone,region,ufc,rm)
    db_config = YAML.load_file('config/database.yml')['development'] 
    conn = OCI8.new(
      db_config['username'],
      db_config['password'],
      db_config['database'] 
    )
  	procedure_name = 'MISVPAY_NFO_SALES_DETAILS_SP'
    cursor = conn.parse("BEGIN #{procedure_name}(:P_EMPLID, :P_EMPROLE, :P_ZONE, :P_REGION_CODE, :P_UFC_CODE, :P_RMCODE); END;")
   
    cursor.bind_param(':P_EMPLID', emp_id, String)
    cursor.bind_param(':P_EMPROLE', emprole, String)
    cursor.bind_param(':P_ZONE', zone, String)
    cursor.bind_param(':P_REGION_CODE', region, String)
    cursor.bind_param(':P_UFC_CODE', ufc, String)
    cursor.bind_param(':P_RMCODE', rm, String)

    cursor.exec
    cursor.close
    conn.logoff
  end
end
    