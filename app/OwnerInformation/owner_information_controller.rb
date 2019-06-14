require 'rho/rhocontroller'
require 'helpers/application_helper'
require 'helpers/browser_helper'

class OwnerInformationController < Rho::RhoController
  include ApplicationHelper
  include BrowserHelper

  def index
    @src = AssetInformation.find(@params['asset_information_id'])
    if @src
      @owner_informations = OwnerInformation.find :all,:conditions=>{:asset_information_id=>@params['asset_information_id']}
      render :action=>:index,:back=>url_for(:controller=>:AssetInformation,:action=>:show,:id=>@params['asset_information_id'])
    else
      object_not_found
    end
  end

  def show
    @owner_information = OwnerInformation.find @params['id']
    if @owner_information
      redirect :action=>:edit,:id=>@owner_information.object
    else
      object_not_found
    end
  end

  def new
    @owner_information = OwnerInformation.new({:asset_information_id=>@params['asset_information_id']})
    render :action=>:form, :back=>url_for(:action=>:index,:query=>{:asset_information_id=>@params['asset_information_id']})
  end

  def create
    @owner_information = OwnerInformation.new(@params['owner_information'])
    @owner_information.created_at = Time.now
    owner_informations_url = url_for :action=>:index,:query=>{:asset_information_id=>@owner_information.asset_information_id}
    if @owner_information.validate_and_save
      redirect owner_informations_url
    else
      render :action=>:form, :back=> owner_informations_url
    end
  end

  def edit
    @owner_information = OwnerInformation.find @params['id']
    if @owner_information
      render :action=>:form, :back=>url_for(:action=>:index,:query=>{:asset_information_id=>@owner_information.asset_information_id})
    else
      object_not_found
    end
  end

  def update
    @owner_information = OwnerInformation.find @params['id']
    if @owner_information
      @owner_information.attributes = @params['owner_information']
      @owner_information.updated_at = Time.now
      owner_informations_url = url_for :action=>:index,:query=>{:asset_information_id=>@owner_information.asset_information_id}
      if @owner_information.validate_and_save
        redirect owner_informations_url
      else
        render :action=>:form, :back=> owner_informations_url
      end
    else
      object_not_found
    end
  end

  def delete
    @owner_information = OwnerInformation.find @params['id']
    if @owner_information
      owner_informations_url = url_for :action=>:index,:query=>{:asset_information_id=>@owner_information.asset_information_id}
      @owner_information.destroy
      redirect owner_informations_url
    else
      object_not_found
    end
  end
end