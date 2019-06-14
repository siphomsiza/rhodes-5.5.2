require 'rho/rhocontroller'
require 'helpers/application_helper'
require 'helpers/browser_helper'

class RatesHistoryController < Rho::RhoController
  include BrowserHelper
  include ApplicationHelper

  def index
    @municipal_roll_register = AssetInformation.find @params['municipal_roll_register_id']
    if @municipal_roll_register
      @rates_histories = RatesHistory.find :all,:conditions=>{:municipal_roll_register_id=>@params['municipal_roll_register_id']}
      render :action=>:index, :back=>url_for(:controller=>:AssetInformation,:action=>:edit,:id=>@municipal_roll_register.object)
    else
      object_not_found
    end
  end

  def show
    @rates_history = RatesHistory.find @params['id']
    if @rates_history
      redirect :action=>:edit,:id=>@rates_history.object
    else
      object_not_found
    end
  end

  def new
    @municipal_roll_register = AssetInformation.find @params['municipal_roll_register_id']
    if @municipal_roll_register
      @rates_history = RatesHistory.new({:municipal_roll_register_id=>@municipal_roll_register.object})
      render :action=>:form, :back=>index_url
    else
      object_not_found
    end
  end

  def create
    @rates_history = RatesHistory.new(@params['rates_history'])
    @rates_history.created_at = Time.now
    @municipal_roll_register = AssetInformation.find @rates_history.municipal_roll_register_id
    if @municipal_roll_register
      if @rates_history.validate_and_save
        redirect index_url
      else
        render :action=>:form, :back=>index_url
      end
    else
      object_not_found
    end
  end

  def edit
    @rates_history = RatesHistory.find @params['id']
    if @rates_history
      @municipal_roll_register = AssetInformation.find @rates_history.municipal_roll_register_id
      render :action=>:form, :back=>index_url
    else
      object_not_found
    end
  end

  def update
    @rates_history = RatesHistory.find @params['id']
    if @rates_history
      @municipal_roll_register = AssetInformation.find @rates_history.municipal_roll_register_id
      @rates_history.attributes = @params['rates_history']
      @rates_history.updated_at = Time.now
      if @rates_history.validate_and_save
        redirect index_url
      else
        render :action=>:form, :back=>index_url
      end
    else
      object_not_found
    end
  end

  def delete
    @rates_history = RatesHistory.find @params['id']
    if @rates_history
      @municipal_roll_register = AssetInformation.find @rates_history.municipal_roll_register_id
      @rates_history.destroy
      redirect index_url
    else
      object_not_found
    end
  end

private

  def index_url
    url_for(:action=>:index,:query=>{:municipal_roll_register_id=>@municipal_roll_register.object})
  end

end