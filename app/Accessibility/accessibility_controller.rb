require 'rho/rhocontroller'
require 'helpers/browser_helper'

class AccessibilityController < Rho::RhoController
  include BrowserHelper
  def show
    @accessibility = Accessibility.find(@params['id'])
    if @accessibility
      redirect url_for(:controller=>:Facility,:action=>:edit, :id=>@accessibility.facility_id,:query=>{:block=>'1'})
    else
      redirect url_for(:controller=>:Facility,:action=>:index)
    end
  end
  def create
    @accessibility = Accessibility.new(@params['accessibility'])
    @accessibility.created_at = Time.now
    Log.record 'OFFLINE_SAVE_CHANGES', @accessibility.facility.code, 'Create Accessibility',@accessibility.access_feature.label
    Alert.show_popup( :message=>@accessibility.errors[:msg] ,:buttons => ['Ok'] ) unless @accessibility.validate_and_save
    redirect url_for(:controller=>:Facility,:action=>:edit, :id=>@accessibility.facility_id,:query=>{:block=>@params['block']})
  end

  def update
    @accessibility = Accessibility.find(@params['id'])
    if @accessibility
      @accessibility.update_attributes(@params['accessibility'].merge({'updated_at'=>Time.now}))
      Log.record 'OFFLINE_SAVE_CHANGES', @accessibility.facility.code, 'Update Accessibility',@accessibility.access_feature.label
      url = url_for :controller=>:Facility,:action=>:edit, :id=>@accessibility.facility_id, :query=>{:block=>@params['block']}
    else
      Alert.show_popup :message=>'Internal error: Object not found',:buttons => ['Ok']
      url = url_for :controller=>:Facility, :action=>:index
    end
    redirect url
  end

  # POST /Accessibility/{1}/delete
  def delete
    @accessibility = Accessibility.find(@params['id'])
    if @accessibility
      url = url_for :controller=>:Facility,:action=>:edit,:id=>@accessibility.facility_id,:query=>{:block=>@params['block']}
      Log.record 'OFFLINE_SAVE_CHANGES', @accessibility.facility.code, 'Delete Accessibility',@accessibility.access_feature.label
      @accessibility.destroy
    else
      url = url_for :controller=>:Facility,:action=>:index
      Alert.show_popup :message=>'Internal error: Object not found',:buttons => ['Ok']
    end
    redirect url
  end

end
