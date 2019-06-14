require 'rho/rhocontroller'
require 'helpers/browser_helper'
require "helpers/facility_helper"

class FacilityController < Rho::RhoController
  include BrowserHelper
  include FacilityHelper

  #GET /Facility
  def index
    @facilities = Facility.find(:all,:order=>['code'])
    #add_objectnotify(@facilities)
    render :back => Rho::RhoConfig.start_path
  end

  # GET /Facility/{1}
  def show
    @facility = Facility.find(@params['id'])
    if @facility
      render :action => :show, :back => url_for(:action => :index)
    else
      Alert.show_popup :message=>'Internal error: Object not found',:buttons => ['Ok']
      redirect :action => :index
    end
  end

  # GET /Facility/{1}/edit
  def edit
    @facility = Facility.find(@params['id'])
    if @facility
      if @params['block'] == '1'
        @suitability_ratings = Lookup.find_all_by_type('SuitabilityRating')
        @access_features = Lookup.find_all_by_type('AccessFeature')
        @accessibilities = Accessibility.find(:all,:conditions=>{'facility_id'=>@facility.object},:order=>'access_feature_id')
        new_feature = Accessibility.new
        new_feature.facility_id = @facility.object
        @accessibilities << new_feature
      end
      @media_store = MediaStore.find(:first,:conditions=>{'t'=>'Photo','src_t'=>'Facility','src_id'=>@facility.object}) if @params['block'] == '10'
      @media_store = MediaStore.find(:first,:conditions=>{'t'=>'DrawningPlan','src_t'=>'Facility','src_id'=>@facility.object}) if @params['block'] == '11'
      render :action =>:edit, :back => url_for(:action => :show,:id=>@facility.object)
    else
      Alert.show_popup :message=>'Internal error: Object not found',:buttons => ['Ok']
      redirect :action => :index
    end
  end

  # POST /Facility/{1}/update
  def update
    @facility = Facility.find(@params['id'])
    if @facility
      @facility.update_attributes(@params['facility'].merge('updated_at'=>Time.now))
      Log.record 'OFFLINE_SAVE_CHANGES', @facility.code,'Facility attributes'
      render :action => :show
    else
      Alert.show_popup :message=>'Internal error: Object not found',:buttons => ['Ok']
      redirect :action => :index
    end
  end

 def showmap
   @facility = Facility.find(@params['id'])
   map_params = {
          :provider => @params['provider'],
          :settings => {:map_type => "hybrid", :region => [@facility.latitude.to_f, @facility.longitude.to_f, 0.2, 0.2],
                        :zoom_enabled => true, :scroll_enabled => true, :shows_user_location => true},
          :annotations => [{:latitude => @facility.latitude, :longitude => @facility.longitude, :title => @facility.code, :subtitle => @facility.name}]
               }
   MapView.create map_params
   render :action => :location, :back=> url_for(:action=>:location,:id=>@facility.object)
  end

  def components
    @facility = Facility.find(@params['id'])
    @components = Component.find(:all,:conditions=>{"t"=>@params['t'], "src_t"=>'Facility','src_id'=>@facility.object},:order=>"item_no")
    c = Component.find(:first,:select=>'item_no',:conditions=>{"t"=>@params['t'], "src_t"=>'Facility','src_id'=>@facility.object},:order=>"item_no",:orderdir=>'DESC')
    new_component = Component.new
    new_component.item_no = '%02d' % (c.nil? ? 1 : c.item_no.to_i+1)
    new_component.t = @params['t']
    new_component.src_t = 'Facility'
    new_component.src_id = @facility.object
    @components << new_component
    load_lookups
    render :action=>:components
  end

  def boundary_polygons
    @facility = Facility.find(@params['id'])
    @boundary_polygons = BoundaryPolygon.find(:all,:conditions=>{'facility_id'=>@facility.object})
    render :action=>:boundary_polygons, :back=> url_for(:action=>:index)
  end

  def signoff
    if Rho::RhoConnectClient.isLoggedIn && System.get_property('has_network')
      signoff_status = Lookup.find_first_by_type_and_label('AssetStatus','Assessor Signoff')
      @facility = Facility.find(@params['id'])
      FacilityStatus.find(:all,:conditions=>{:facility_id=>@facility.object}).each {|fs| fs.update_attributes({'asset_status_id' => signoff_status.object,'updated_at'=>Time.now }) }
      Log.record 'OFFLINE_SIGNOFF', @facility.code
      redirect :controller=>:Settings,:action=>:do_sync
    else
      Alert.show_popup :message=>'No network or not logged',:buttons => ['Ok']
      render :action=>:show, :back=> url_for(:action=>:index)
    end
  end

  def checkin
    if Rho::RhoConnectClient.isLoggedIn && System.get_property('has_network')
      unless Rhom::any_model_changed?
        @facility = Facility.find(@params['id'])
        #Facility.set_notification(  url_for(:controller=>:Facility,:action => :sync_notify),  "id={#{@facility.object}}")
        @facility.update_attributes({'offline_client_id' => '' })
        Log.record 'OFFLINE_CHECKIN',@facility.code
        #SyncEngine::dosync_source(Facility.get_source_id)
        #@msg = 'Check In triggered'
        #render :file=>'Settings/wait_sync'
        redirect :controller=>:Settings,:action=>:do_sync#,:query=>{:source=>'Facility'}
      else
        Alert.show_popup :message=>'Need sync data. before checkin',:buttons => ['Ok']
        redirect Rho::RhoConfig.start_path
      end
    else
      Alert.show_popup :message=>'No network or not logged',:buttons => ['Ok']
      redirect Rho::RhoConfig.start_path
    end
  end

  def checkout
    if Rho::RhoConnectClient.isLoggedIn && System.get_property('has_network')
      @facility = Facility.find(@params['id'])
      #Facility.set_notification url_for(:controller=>:Facility,:action => :sync_notify),  "id={#{@facility.object}}"
      #@facility.update_attributes({'condition_assessment_status_id' => Lookup.find_first_by_type_and_label('AssetStatus','In Progress').object}) if Lookup.find_first_by_type_and_label('AssetStatus','To Do').object == @facility.condition_assessment_status_id
      @facility.update_attributes({'offline_client_id' => System::get_property('phone_id') })
      Log.record 'OFFLINE_CHECKOUT',@facility.code
      in_progress_status = Lookup.find_first_by_type_and_label('AssetStatus','In Progress')
      FacilityStatus.find(:all,:conditions=>{:facility_id=>@facility.object}).each {|fs| fs.update_attributes({'asset_status_id' => in_progress_status.object }) }
      #SyncEngine::dosync_source(Facility.get_source_id)
      #@msg = 'Check Out triggered'
      #render :file=>'Settings/wait_sync'
      redirect :controller=>:Settings,:action=>:do_sync#,:query=>{:source=>'Facility'}
    else
      Alert.show_popup :message=>'No network or not logged',:buttons => ['Ok']
      redirect Rho::RhoConfig.start_path
    end
  end

  def sync_notify
    if @params['status'] == 'in_progress'
      WebView.refresh
    else
      unless @params['status'] == 'ok'
        @facility = Facility.find(@params['id'])
        @facility.update_attributes({'offline_client_id' => @facility.offline_client_id == System::get_property('phone_id') ? '' : System::get_property('phone_id') })
        Alert.show_popup :message=>"Sync error #{@params['error_message']} (#{@params['error_code']})",:buttons => ['Ok']
      end
      WebView.navigate url_for(:action=>:show,:id=>@params['id'])
    end
  end

  private

  def get_suitability_ratings
    Lookup.find(:all,:conditions=>["type = ?","'SuitabilityRating'"],:order=>['label']).inject([]) {|arr,t| arr << [t.description,t.object]}
  end

end
