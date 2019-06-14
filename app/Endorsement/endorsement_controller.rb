require 'rho/rhocontroller'
require 'helpers/application_helper'
require 'helpers/browser_helper'


class EndorsementController < Rho::RhoController
  include ApplicationHelper
  include BrowserHelper
  def index
    @src = AssetInformation.find(@params['asset_information_id'])
    if @src
      @endorsements = Endorsement.find :all,:conditions=>{:asset_information_id=>@params['asset_information_id']}
      render :action=>:index,:back=>url_for(:controller=>:AssetInformation,:action=>:show,:id=>@params['asset_information_id'])
    else
      object_not_found
    end
  end

  def show
    @endorsement = Endorsement.find @params['id']
    if @endorsement
      redirect :action=>:edit,:id=>@endorsement.object
    else
      object_not_found
    end
  end

  def new
    @endorsement = Endorsement.new({:asset_information_id=>@params['asset_information_id']})
    render :action=>:form, :back=>url_for(:action=>:index,:query=>{:asset_information_id=>@params['asset_information_id']})
  end

  def create
    @endorsement = Endorsement.new(@params['endorsement'])
    @endorsement.created_at = Time.now
    endorsement_url = url_for :action=>:index,:query=>{:asset_information_id=>@endorsement.asset_information_id}
    if @endorsement.validate_and_save
      redirect endorsement_url
    else
      render :action=>:form, :back=>endorsement_url
    end
  end

  def edit
    @endorsement = Endorsement.find @params['id']
    if @endorsement
      render :action=>:form, :back=>url_for(:action=>:index,:query=>{:asset_information_id=>@endorsement.asset_information_id})
    else
      object_not_found
    end
  end

  def update
    @endorsement = Endorsement.find @params['id']
    if @endorsement
      @endorsement.attributes = @params['endorsement']
      @endorsement.updated_at = Time.now
      endorsement_url = url_for :action=>:index,:query=>{:asset_information_id=>@endorsement.asset_information_id}
      if @endorsement.validate_and_save
        redirect endorsement_url
      else
        render :action=>:form, :back=>endorsement_url
      end
    else
      object_not_found
    end
  end

  def delete
    @endorsement = Endorsement.find @params['id']
    if @endorsement
      endorsement_url = url_for :action=>:index,:query=>{:asset_information_id=>@endorsement.asset_information_id}
      @endorsement.destroy
      redirect endorsement_url
    else
      object_not_found
    end
  end
end