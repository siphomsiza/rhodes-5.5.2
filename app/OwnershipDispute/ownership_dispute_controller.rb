require 'rho/rhocontroller'
require 'helpers/application_helper'
require 'helpers/browser_helper'

class OwnershipDisputeController < Rho::RhoController
  include BrowserHelper
  include ApplicationHelper

  def index
    @municipal_roll_register = AssetInformation.find @params['municipal_roll_register_id']
    if @municipal_roll_register
      @ownership_disputes = OwnershipDispute.find :all,:conditions=>{:municipal_roll_register_id=>@params['municipal_roll_register_id']}
      render :action=>:index, :back=>url_for(:controller=>:AssetInformation,:action=>:edit,:id=>@municipal_roll_register.object)
    else
      object_not_found
    end
  end

  def show
    @ownership_dispute = OwnershipDispute.find @params['id']
    if @ownership_dispute
      redirect :action=>:edit,:id=>@ownership_dispute.object
    else
      object_not_found
    end
  end

  def new
    @municipal_roll_register = AssetInformation.find @params['municipal_roll_register_id']
    if @municipal_roll_register
      @ownership_dispute = OwnershipDispute.new({:municipal_roll_register_id=>@municipal_roll_register.object})
      render :action=>:form, :back=>index_url
    else
      object_not_found
    end
  end

  def create
    @ownership_dispute = OwnershipDispute.new(@params['ownership_dispute'])
    @ownership_dispute.created_at = Time.now
    @municipal_roll_register = AssetInformation.find @ownership_dispute.municipal_roll_register_id
    if @municipal_roll_register
      if @ownership_dispute.validate_and_save
        redirect index_url
      else
        render :action=>:form, :back=>index_url
      end
    else
      object_not_found
    end
  end

  def edit
    @ownership_dispute = OwnershipDispute.find @params['id']
    if @ownership_dispute
      @municipal_roll_register = AssetInformation.find @ownership_dispute.municipal_roll_register_id
      render :action=>:form, :back=>index_url
    else
      object_not_found
    end
  end

  def update
    @ownership_dispute = OwnershipDispute.find @params['id']
    if @ownership_dispute
      @municipal_roll_register = AssetInformation.find @ownership_dispute.municipal_roll_register_id
      @ownership_dispute.attributes = @params['ownership_dispute']
      @ownership_dispute.updated_at = Time.now
      if @ownership_dispute.validate_and_save
        redirect index_url
      else
        render :action=>:form, :back=>index_url
      end
    else
      object_not_found
    end
  end

  def delete
    @ownership_dispute = OwnershipDispute.find @params['id']
    if @ownership_dispute
      @municipal_roll_register = AssetInformation.find @ownership_dispute.municipal_roll_register_id
      @ownership_dispute.destroy
      redirect index_url
    else
      object_not_found
    end
  end

private

  def index_url
    url_for :action=>:index,:query=>{:municipal_roll_register_id=>@municipal_roll_register.object}
  end

end