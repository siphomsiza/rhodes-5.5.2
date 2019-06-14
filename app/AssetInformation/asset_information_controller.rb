require 'rho/rhocontroller'
require 'helpers/application_helper'
require 'helpers/browser_helper'
require 'helpers/facility_helper'

class AssetInformationController < Rho::RhoController
  include BrowserHelper
  include ApplicationHelper
  include FacilityHelper

  def index
    @facility = Facility.find @params['facility_id']
    if @facility
      @asset_informations = AssetInformation.find :all, :conditions=>{:facility_id=>@facility.object,:type=>@params['type']}
      render :action=>:index,:back=>url_for(:controller=>:Facility,:aqction=>:show,:id=>@facility.object)
    else
      object_not_found
    end
  end

  def show
    redirect :action=>:edit, :id=>@params['id']
  end

  def new
    @facility = Facility.find @params['facility_id']
    if @facility
      @asset_information = AssetInformation.new({:facility_id=>@facility.object,:type=>@params['type']})
      render :action=>:form, :back=> index_url
    else
      object_not_found
    end
  end

  def create
    @asset_information = AssetInformation.new(@params['asset_information'])
    @asset_information.created_at = Time.now
    @facility = Facility.find @asset_information.facility_id
    if @facility
      if @asset_information.validate_and_save
        redirect index_url
      else
        render :action=>:form, :back=> index_url
      end
    else
      object_not_found
    end
  end

  def edit
    @asset_information = AssetInformation.find @params['id']
    if @asset_information
      @facility = Facility.find @asset_information.facility_id
      render :action=>:form, :back=> index_url
    else
      object_not_found
    end
  end

  def update
    @asset_information = AssetInformation.find @params['id']
    if @asset_information
      @facility = Facility.find @asset_information.facility_id
      @asset_information.attributes = @params['asset_information']
      @asset_information.updated_at = Time.now
      if @asset_information.validate_and_save
        redirect index_url
      else
        render :action=>:form, :back=> index_url
      end
    else
      object_not_found
    end
  end

  def delete
    @asset_information = AssetInformation.find @params['id']
    if @asset_information
      @asset_information.before_delete
      @asset_information.destroy
      redirect index_url
    else
      object_not_found
    end
  end

  private

  def index_url
    url_for :action=>:index,:query=>{:facility_id=>@asset_information.facility_id,:type=>@asset_information.type}
  end

end