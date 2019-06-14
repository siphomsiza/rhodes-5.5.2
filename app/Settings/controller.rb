require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'
require 'json'
require "fileutils"

class SettingsController < Rho::RhoController
  include BrowserHelper

  def index
    @msg = @params['msg']
    render :back=>Rho::RhoConfig.start_path
  end

  def send_log
    Rho::RhoConfig.send_log
    render :action => :index
  end

  def login
    @msg = @params['msg']
    render :action => :login, :back=>Rho::RhoConfig.start_path
  end

  def wait
    render :action=>:wait, :back=>Rho::RhoConfig.start_path
  end

  def wait_sync
    @msg = @params['msg']
    render :action=>:wait_sync, :back=>Rho::RhoConfig.start_path
  end

  def login_callback
    errCode = @params['error_code'].to_i
    if errCode == 0
      Log.record_data 'OFFLINE_LOGIN','Success'
      # run sync if we were successful
      # WebView.navigate Rho::RhoConfig.options_path
      if Facility.find(:count) == 0
        WebView.navigate url_for(:action => :wait_sync, :query => {:msg => "Sync has been triggered."})
        Rho::RhoConnectClient.dosync
      else
        WebView.navigate url_for(:controller=>:Facility,:action=>:index)
      end
    else
      if errCode == Rho::RhoError::ERR_CUSTOMSYNCSERVER
        @msg = @params['error_message']
      end

      if !@msg || @msg.length == 0
        @msg = Rho::RhoError.new(errCode).message
      end
      Log.record_data 'OFFLINE_LOGIN',@params['login'], 'Failure', @msg
      WebView.navigate(url_for :action => :login, :query => {:msg => @msg})
    end
  end

  def geo_callback
    if @params['known_position'].to_i != 0 && @params['status'] =='ok'
      Log.set_position @params['latitude'], @params['longitude'], @params['accuracy']
    else
      Log.set_position
    end
    WebView.execute_js("update_accuracy('#{@params['status'] =='ok' ? @params['accuracy'].to_i.to_s : '?'}m')") if WebView.current_location =~ /app\/index/
  end

  def do_login
    if @params['login'] and @params['password']
      #TODO
      # if Rhom::any_model_changed? && !(Rho::RhoConnectClient.userName == @params['login'])
      #   @msg = "Only the user '#{Rho::RhoConnectClient.userName}' can login"
      #   Log.record_data 'OFFLINE_LOGIN',@params['login'], 'Failure', @msg
      #   render :action => :login, :back=>Rho::RhoConfig.start_path
      # else
        begin
          Rho::RhoConnectClient.login(@params['login'], @params['password'], (url_for :action => :login_callback))
          render :action => :wait
        rescue Rho::RhoError => e
          @msg = e.message
          Log.record_data 'OFFLINE_LOGIN',@params['login'], 'Failure', @msg
          render :action => :login, :back=>Rho::RhoConfig.start_path
        end
      #end
    else
      @msg = Rho::RhoError.err_message(Rho::RhoError::ERR_UNATHORIZED) unless @msg && @msg.length > 0
      Log.record_data 'OFFLINE_LOGIN',@params['login'], 'Failure', @msg
      render :action => :login, :back=>Rho::RhoConfig.start_path
    end
  end

  def logout
    Rho::RhoConnectClient.logout
    Log.record 'OFFLINE_LOGOUT', 'Success'
    @msg = "You have been logged out."
    render :action => :login, :back=>Rho::RhoConfig.start_path
  end

  def do_reset
    Rhom::Rhom.database_full_reset(false, false)
    #Rho::RhoConnectClient.dosync
    @msg = "Database has been reset."
    Log.record 'OFFLINE_DB_RESET', 'Success'
    redirect :action => :index, :query => {:msg => @msg}
  end

  def do_sync
    if Rho::RhoConnectClient.isLoggedIn && System.get_property('has_network')

      if @params['source']
        Rho::RhoConnectClient.dosync_source(@params['source'])
      else
        Rho::RhoConnectClient.dosync
      end

      #WebView.navigate(url_for :action => :wait_sync,  :query => {:msg => "Sync has been triggered."})
      #redirect :action => :wait_sync, :query => {:msg => "Sync has been triggered."}
      @msg = "Sync has been triggered."
      render :action=>:wait_sync
    else
      Alert.show_popup :message=>'No network or not logged',:buttons => ['Ok']
      redirect Rho::RhoConfig.start_path
    end
  end

  def err_sync
    @data = Rho::JSON.parse @params['data']
    render :action=>:err_sync, :back=> Rho::RhoConfig.start_path
  end

  #def sync_object_notify
  #  puts 'sync_object_notify: ' + @params.inspect
  #  WebView.refresh
  #end
  def backup
    #Rhom::RhomDbAdapter.new(Rho::RhoFSConnector::get_db_fullpathname(partition), partition)
    #db_content = File.binread(Rho::RhoFSConnector::get_db_fullpathname('user'))
    #f = File.new('/sdcard/external_sd/sable_mat_backup.sqlite', "wb")
    #f.write(db_content)
    #f.close
    FileUtils::mkdir_p(Rho::RhoConfig.backup_folder) unless File.exists?(Rho::RhoConfig.backup_folder)
    FileUtils::cp(Rho::RhoFSConnector::get_db_fullpathname('user'), Rho::RhoConfig.backup_folder) #sable_mat_backup.sqlite
    FileUtils::cp_r(Rho::RhoApplication::get_blob_folder,Rho::RhoConfig.backup_folder)
    @msg = "Database has been backed up successfully."
    Log.record 'OFFLINE_BACKUP', 'Success'
    redirect :action => :index, :query => {:msg => @msg}
  end

  def restore

    #Rhom::Rhom.database_full_reset(false, false)
    #db = Rhom::RhomDbAdapter.new('/mnt/sdcard/sable_mat_backup.sqlite','user')
    #Rho::RhoConfig.sources.each do |s|
    #  db.select_from_table( s[0],'*').each {|r| db.insert_into_table(s[0],r) }
    #end
    #db.select_from_table('changed_values','*').each {|r| Rho::RHO.get_user_db.insert_into_table('changed_values',r)}
    #db.close

    #db_content = File.binread('/sdcard/external_sd/sable_mat_backup.sqlite')
    #f = File.open(Rho::RhoFSConnector::get_db_fullpathname('user'), "wb")
    #f.write(db_content)
    #f.close
    client_info = Rho::RHO.get_user_db.select_from_table('client_info','*')
    if File::exists?(Rho::RhoConfig.backup_folder)
      if File::exists?("#{Rho::RhoConfig.backup_folder}/syncdbuser.sqlite")
        FileUtils::cp "#{Rho::RhoConfig.backup_folder}/syncdbuser.sqlite",Rho::RhoFSConnector::get_db_fullpathname('user')
        FileUtils::cp_r("#{Rho::RhoConfig.backup_folder}/db-files/.",Rho::RhoApplication::get_blob_folder)
        Rho::RHO.get_user_db.delete_all_from_table('client_info')
        Rho::RHO.get_user_db.insert_into_table('client_info', client_info[0])  unless client_info.empty?
        @msg = "Database has been restored."
        Alert.show_popup :message=>'Need restart application',:buttons => ['Ok']
        System.exit
      else
        @msg = "Backup file '#{Rho::RhoConfig.backup_folder}/syncdbuser.sqlite' not found."
      end
    else
      @msg = "Backup folder '#{Rho::RhoConfig.backup_folder}' not found."
    end
    redirect :action => :index, :query => {:msg => @msg}
  end

  def sync_notify
  	status = @params['status'] ? @params['status'] : ""

  	#Alert.show_status( "", (@params['source_name'].nil? ? "Sync #{status}" : "#{@params['source_name']} : #{status}"), Rho::RhoMessages.get_message('hide'))

  	if status == "in_progress"
  	    #do nothing
    elsif status == "complete"  #|| status == "ok"
      WebView.navigate (Facility.count > 0 ? url_for(:controller=>:Facility,:action=>:index) : Rho::RhoConfig.start_path )#Rho::RhoConfig.start_path if ( @params['sync_type'] != 'bulk')  #&&  $sync_errors.empty?
    elsif status == 'ok'
      #TODO I must enable the logs for sync_notify
      #Log.record 'OFFLINE_SYNC', 'Success' if @params['source_name'] == 'FacilityStatus'
      WebView.navigate url_for(:action=>:wait_sync,:query=>{:msg=>(@params['source_name'].nil? ? "Sync #{status}" : "#{@params['source_name']} : #{status}")})
    elsif status == "error"
      if !@params['server_errors'].nil? && !@params['server_errors']['query-error'].nil? && !@params['server_errors']['query-error']['message'].nil? && @params['server_errors']['query-error']['message'] == '403 Forbidden'
        # skip
      else
        Rho::RhoConnectClient.stop_sync
        if @params['server_errors']
          Rho::RhoConnectClient.on_sync_create_error( @params['source_name'], @params['server_errors']['create-error'].keys(), :recreate) if @params['server_errors']['create-error'] #will push this object to server again at next sync.
          #SyncEngine.on_sync_update_error( @params['source_name'], @params['server_errors']['update-error'],:retry) if @params['server_errors']['update-error'] #will push update object operation to server again at next sync.
          #SyncEngine.on_sync_delete_error( @params['source_name'], @params['server_errors']['delete-error'], :retry) if @params['server_errors']['delete-error']
          if @params['server_errors']['update-error'] #will push update object operation to server again at next sync.
            if @params['source_name'] == 'FacilityStatus'
              Rho::RhoConnectClient.on_sync_update_error( @params['source_name'], @params['server_errors']['update-error'], :rollback, @params['server_errors']['update-rollback'])
            else
              Rho::RhoConnectClient.on_sync_update_error( @params['source_name'], @params['server_errors']['update-error'],:retry)
            end
              #facility = Facility.find(@params['server_errors']['update-error'].to_a[0])[0]
              #facility.condition_assessment_status_id = @params['server_errors']['update-rollback'].to_a[1]['attributes']['condition_assessment_status_id'] unless @params['server_errors']['update-error'].to_a[1]['attributes']['condition_assessment_status_id'].nil?
              #facility.offline_client_id = @params['server_errors']['update-rollback'].to_a[1]['attributes']['offline_client_id'] unless @params['server_errors']['update-error'].to_a[1]['attributes']['offline_client_id'].nil?
              #facility.save
              #if @params['server_errors']['update-rollback']['condition_assessment_status_id'] || @params['server_errors']['update-rollback']['offline_client_id']
              #  facility = Facility.find(@params['server_errors']['update-error'].to_a[0])[0]
              #  facility.condition_assessment_status_id = @params['server_errors']['update-rollback']['condition_assessment_status_id'] if #sp.object unless sp.object == facility.condition_assessment_status_id
              #  facility.offline_client_id = #System::get_property('phone_id') if facility.offline_client_id.nil? || facility.offline_client_id.empty?
              #  facility.save
              #end
          end

        end

        err_code = @params['error_code'].to_i
        rho_error = Rho::RhoError.new(err_code)
        unless @msg && @msg.length > 0
          @msg = @params['error_message'] if err_code == Rho::RhoError::ERR_CUSTOMSYNCSERVER
          @msg = rho_error.message() unless @msg && @msg.length > 0
        end
        #TODO I must enable the logs for sync_notify
        #Log.record 'OFFLINE_SYNC', 'Failure',@params['source_name']

        if  rho_error.unknown_client?(@params['error_message'])
            if Rhom::any_model_changed?
              #TODO WARNING:Undocumented clear client info
              ::Rho::RHO.get_user_db().execute_sql("UPDATE client_info SET client_id=?, token=?, token_sent=?", ["","",0])
            else
              Rhom::Rhom.database_client_reset
            end
            Rho::RhoConnectClient.dosync
        elsif err_code == Rho::RhoError::ERR_UNATHORIZED
            WebView.navigate ( url_for :action => :login, :query => {:msg => "Server credentials are expired"} )
        else
            WebView.navigate ( url_for :action => :err_sync, :query => {:msg => @msg,:data=>@params.to_json} )
        end
      end
	  end
  end
end
