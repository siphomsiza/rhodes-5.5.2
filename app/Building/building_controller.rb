require 'rho/rhocontroller'
require 'helpers/browser_helper'
require 'helpers/application_helper'
require 'helpers/component_helper'

class BuildingController < Rho::RhoController
  include BrowserHelper
  include ApplicationHelper
  include ComponentHelper

  #GET /Building
  def index
    @facility = Facility.find @params['facility_id']
    if @facility
      @buildings = @facility.buildings
      render :action=>:index, :back=>url_for( :controller=>:Facility,:action=>:show,:id=>@facility.object )
    else
      object_not_found
    end
  end

  # GET /Building/{1}
  def show
    @building = Building.find(@params['id'])
    if @building
      render :action => :show, :back => url_for(:action => :index,:query=>{:facility_id=>@building.facility.object})
    else
      object_not_found
    end
  end

  # GET /Building/new
  def new
    @facility = Facility.find(@params['facility_id'])
    if @facility
      @building = Building.new({:facility_id => @facility.object,:floor_count => 1})
      render :action => :new, :back => url_for(:action => :index,:query=>{:facility_id=>@facility.object})
    else
      object_not_found
    end
  end

  # GET /Building/{1}/edit
  def edit
    @building = Building.find(@params['id'])
    if @building
      @media_store = MediaStore.find(:first,:conditions=>{'t'=>'Photo','src_t'=>'Building','src_id'=>@building.object}) if @params['block'] == '10'
      @media_store = MediaStore.find(:first,:conditions=>{'t'=>'DrawningPlan','src_t'=>'Building','src_id'=>@building.object}) if @params['block'] == '11'
      render :back => url_for(:controller=>:Building, :action=>:show,:id=>@building.object)
    else
      object_not_found
    end
  end

  # POST /Building/create
  def create
    @building = Building.new(@params['building'])
    @building.created_at = Time.now
    if @building.validate_and_save
      Log.record 'OFFLINE_SAVE_CHANGES', @building.facility.code, 'Create Building',@building.building_no
      @building.add_construction_elements if @building.facility.condition_assessment_data_accessibly?
      redirect :action => :show,:id=>@building.object
    else
      render :action=>:new,:back=>url_for(:action=>:index,:query=>{:facility_id=>@building.facility_id})
    end
  end

  # POST /Building/{1}/update
  def update
    @building = Building.find(@params['id'])
    if @building
      @building.attributes = @params['building']
      @building.updated_at = Time.now
      if @building.validate_and_save
        Log.record 'OFFLINE_SAVE_CHANGES', @building.facility.code, 'Update Building',@building.building_no
        redirect :controller=>:Building, :action =>:show,:id=>@building.object
      else
        render :action=>:edit,:back=>url_for(:action=>:index,:query=>{:facility_id=>@building.facility.object})
      end
    else
      object_not_found
    end
  end

  # POST /Building/{1}/delete
  def delete
    @building = Building.find(@params['id'])
    if @building
      @building.before_delete
      Log.record 'OFFLINE_SAVE_CHANGES', @building.facility.code, 'Delete Building',@building.building_no
      @building.destroy
      redirect url_for :action => :index,:query=>{:facility_id=>@building.facility.object}
    else
      object_not_found
    end
  end

  def showmap
    @building = Building.find(@params['id'])
    map_params = {
           :provider => 'Google',
           :settings => {:map_type => "hybrid", :region => [@building.latitude.to_f, @building.longitude.to_f, 0.2, 0.2],
                         :zoom_enabled => true, :scroll_enabled => true, :shows_user_location => true},
           :annotations => [{:latitude => @building.latitude, :longitude => @building.longitude, :title => @building.building_no, :subtitle => @building.name}]
                }
    MapView.create map_params
    render :action => :edit, :back=> url_for(:controller=>:Building,:action=>:edit,:id=>@building.object,:query=>{:block=>@params['block']})
   end

end
