require 'rho/rhocontroller'
require 'helpers/application_helper'
require 'helpers/browser_helper'
require 'helpers/component_helper'

class ComponentController < Rho::RhoController
  include ApplicationHelper
  include BrowserHelper
  include ComponentHelper

  def index
    @components = Component.find(:all,:conditions=>{"t"=>@params['t'], "src_t"=>@params['src_t'],'src_id'=>@params['src_id']},:order=>"item_no")
    @src = Model::constantinize(@params['src_t']).find(@params['src_id'])
    render :action=>:index, :back=> url_for(:controller=>@params['src_t'].to_sym,:action=>:show,:id=>@params['src_id'],:query=>{'box'=>'2'})
  end

  def show
    @component = Component.find(@params['id'])
    render :action=>:show, :back=> index_url
  end

  def new
    c = Component.find(:first,:select=>'item_no',:conditions=>{"t"=>@params['t'], "src_t"=>@params['src_t'],'src_id'=>@params['src_id']},:order=>"item_no",:orderdir=>'DESC')
    @component = Component.new
    @component.item_no = '%02d' % (c.nil? ? 1 : c.item_no.to_i+1)
    @component.is_present = 'true'
    @component.cause_reason_id = Lookup.find(:first,:conditions=>{:label=>'S',:type=>'CauseReason'}).id
    material_type = Lookup.find(:first,:conditions=>{:label=>'N/A',:type=>ELEMENT_MATERIALS[@params['t']]})
    @component.material_type_id = material_type.id if material_type && @params['t'] != 'BuildingConstruction'
    @component.t = @params['t']
    @component.src_t = @params['src_t']
    @component.src_id = @params['src_id']
    render :action=>:form
  end

  def create
    @component = Component.new(@params['component'])
    @component.created_at = Time.now
    if @component.validate_and_save
      Log.record "OFFLINE_SAVE_CHANGES","Create #{@component.t}",@component.item_no,@component.src_code
      if (@component.condition_rating_level_1.to_i+@component.condition_rating_level_2.to_i) == 100
        redirect index_url
      else
        Alert.show_popup :message=>'Condition not 100%. Please, take photo',:buttons => ['Ok']
        render :action=>:form, :back=> index_url
      end
    else
      load_lookups('BuildingMaterial')
      render :action=>:form, :back=> index_url
    end
  end

  def edit
    @component = Component.find(@params['id'])
    if @component
      @component.validate
      @media_store = MediaStore.find(:first,:conditions=>{'t'=>'Photo','src_t'=>'Component','src_id'=>@component.object})
      render :action=>:form, :back=> index_url
    else
      object_not_found
    end
  end

  def update
    @component = Component.find(@params['id'])
    if @component
      @component.attributes = @params['component']
      @component.updated_at = Time.now
      if @component.validate_and_save
        Log.record "OFFLINE_SAVE_CHANGES","Update #{@component.t}",@component.item_no,@component.src_code
        redirect index_url
      else
        render :action=>:form, :back=> index_url
      end
    else
      object_not_found
    end
  end

  # POST /Component/{1}/delete
  def delete
    @component = Component.find(@params['id'])
    if @component
      @component.before_delete
      Log.record "OFFLINE_SAVE_CHANGES","Delete #{@component.t}",@component.item_no,@component.src_code
      @component.destroy
      redirect index_url
    else
      object_not_found
    end
  end

private
  def index_url
    url_for :controller=>:Component, :action=>:index,:query=>{:t=>@component.t,:src_t=>@component.src_t,:src_id=>@component.src_id}
  end
end
