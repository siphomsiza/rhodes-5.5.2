require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class ChangedValuesController < Rho::RhoController
  include BrowserHelper

  def index
    @msg = @params['msg']
    @changed_values = Rho::RHO.get_user_db.select_from_table 'changed_values','*',nil,{"order by"=>'source_id,object'}
    render :back=>url_for(:controller=>:Settings,:action=>:index)
  end

  def edit
    data_set = Rho::RHO.get_user_db.select_from_table 'changed_values','*',{'source_id'=>@params['source_id'].to_i,'object'=>@params['object'],'attrib'=>@params['attrib'],'update_type'=>@params['update_type']}
    unless data_set.empty?
      @changed_value = data_set[0]
      puts "FOUND RECORD:"
      puts @changed_value.inspect
      render :action=>:form, :back=>url_for(:controller=>:ChangedValues,:action=>:index)
    else
      Alert.show_popup :message=>'Internal error: Record not found',:buttons => ['Ok']
      redirect :action=>:index
    end
  end

  def update
    data_set = Rho::RHO.get_user_db.select_from_table 'changed_values','*',{'source_id'=>@params['source_id'].to_i,'object'=>@params['object'],'attrib'=>@params['attrib'],'update_type'=>@params['update_type']}
    unless data_set.empty?
      @changed_value = data_set[0]
      puts "FOUND RECORD:"
      puts @changed_value.inspect
      Rho::RHO.get_user_db.update_into_table 'changed_values',{'attrib'=>@params['changed_value']['attrib'],'value'=>@params['changed_value']['value'],'sent'=>@params['changed_value']['sent'].to_i},{'source_id'=>@params['source_id'].to_i,'object'=>@params['object'],'attrib'=>@params['attrib'],'update_type'=>@params['update_type']}
      redirect :action=>:index
    else
      Alert.show_popup :message=>'Internal error: Record not found',:buttons => ['Ok']
      redirect :action=>:index
    end
  end

  def delete
    data_set = Rho::RHO.get_user_db.select_from_table 'changed_values','*',{'source_id'=>@params['source_id'].to_i,'object'=>@params['object'],'attrib'=>@params['attrib'],'update_type'=>@params['update_type']}
    unless data_set.empty?
      @changed_value = data_set[0]
      puts "FOUND RECORD:"
      puts @changed_value.inspect
      Rho::RHO.get_user_db.delete_from_table 'changed_values',{'source_id'=>@params['source_id'].to_i,'object'=>@params['object'],'attrib'=>@params['attrib'],'update_type'=>@params['update_type']}
      redirect :action=>:index
    else
      Alert.show_popup :message=>'Internal error: Record not found',:buttons => ['Ok']
      redirect :action=>:index
    end
  end

  def fix
    #Rho::RHO.get_user_db.execute_sql('select distinct object from changed_values').each do |r|
    #  Rho::RHO.get_user_db.insert_into_table 'changed_values',{'object'=>r['object'],'sent'=>0,'source_id'=>12,'attrib'=>'object','update_type'=>'create'}
    #end
    #Rho::RHO.get_user_db.update_into_table 'changed_values',{'attrib'=>'object','value'=>''}
    #Rho::RHO.get_user_db.update_into_table 'changed_values',{'sent'=>0}
    #Rho::RHO.get_user_db.delete_from_table 'changed_values',{'sent'=>2}


    #TODO WARNING:Undocumented clear 'changed_values' table
    ::Rho::RHO.get_user_db().execute_sql("SELECT source_id,object FROM changed_values WHERE update_type = 'create' and sent=2 GROUP BY source_id,object").each do |k|
      ::Rho::RHO.get_user_db().execute_sql("DELETE FROM changed_values WHERE object=?", [k['object']])
      ::Rho::RHO.get_user_db().execute_sql("INSERT INTO changed_values(object,source_id,attrib,update_type,sent) VALUES(?,?,?,?,?)", [k['object'],k['source_id'],'object','create',0])
    end
    redirect :action=>:index
  end
end