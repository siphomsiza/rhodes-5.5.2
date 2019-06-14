require 'rho/rhocontroller'
require 'helpers/browser_helper'

class EducationalNormController < Rho::RhoController
  include BrowserHelper

  def show
    if @params['id']
      redirect url_for(:action=>:edit,:id=>@params['id'])
    else
      @educational_norm = EducationalNorm.find :first,:conditions=>{:facility_id => @params['facility_id']}
      if @educational_norm
        redirect url_for(:action=>:edit,:id=>@educational_norm.object)
      else
        redirect url_for(:action=>:new,:query=>{:facility_id=>@params['facility_id']})
      end
    end
  end

  def new
    @facility = Facility.find @params['facility_id']
    @educational_norm = EducationalNorm.new({:facility_id=>@facility.object})
    @compliances = Lookup.find_all_by_type 'Compliance'
    render :action=>:form, :back=>url_for(:controller=>:Facility,:action=>:show,:id=>@facility.object,:query=>{'box'=>'3'})
  end

  def edit
    @educational_norm = EducationalNorm.find @params['id']
    if @educational_norm
      @facility = Facility.find @educational_norm.facility_id
      @compliances = Lookup.find_all_by_type 'Compliance'
      render :action=>:form,:back=>url_for(:controller=>:Facility,:action=>:show,:id=>@facility.object,:query=>{'box'=>'3'})
    else
      Alert.show_popup :message=>'Internal error: Object not found',:buttons => ['Ok']
      redirect url_for(:controller=>:facility,:action=>:index)
    end
  end

  def create
    @educational_norm = EducationalNorm.new(@params['educational_norm'])
    @educational_norm.created_at = Time.now
    @educational_norm.save
    @facility = Facility.find @educational_norm.facility_id
    redirect url_for(:controller=>:Facility,:action=>:show,:id=>@facility.object,:query=>{'box'=>'3'})
  end

  def update
    @educational_norm = EducationalNorm.find @params['id']
    if @educational_norm
      @educational_norm.update_attributes @params['educational_norm'].merge({'updated_at'=>Time.now})
      @facility = Facility.find @educational_norm.facility_id
      redirect url_for(:controller=>:Facility,:action=>:show,:id=>@facility.object,:query=>{'box'=>'3'})
    else
      Alert.show_popup :message=>'Internal error: Object not found',:buttons => ['Ok']
      redirect url_for(:controller=>:facility,:action=>:index)
    end
  end

end