require 'rho/rhocontroller'
require 'helpers/browser_helper'
require 'helpers/application_helper'
require 'helpers/space_helper'

class SpaceController < Rho::RhoController
  include BrowserHelper
  include ApplicationHelper
  include SpaceHelper

  def index
    @spaces = Space.find :all, :conditions=>{:t=>@params['t'],:src_t=>@params['src_t'],:src_id=>@params['src_id']}
    @src = Model::constantinize(@params['src_t']).find(@params['src_id'])
    render :action=>:index,:back=>url_for(:controller=>@params['src_t'].to_sym,:action=>:show,:id=>@params['src_id'],:query=>{'box'=>'3'})
  end

  def show
    redirect url_for(:action=>:edit,:id=>@params['id'])
  end

  def new
    s = Space.find(:first,:select=>'space_no',:conditions=>{"t"=>@params['t'], "src_t"=>@params['src_t'],'src_id'=>@params['src_id']},:order=>"space_no",:orderdir=>'DESC')
    @space = Space.new
    @space.space_no = s.nil? ? 1 : s.space_no.to_i+1 #'%02d' % (s.nil? ? 1 : s.space_no.to_i+1)
    @space.t = @params['t']
    @space.src_t = @params['src_t']
    @space.src_id = @params['src_id']
    render :action=>:form,:back => index_url
  end

  def create
    @space = Space.new(@params['space'])
    @space.created_at = Time.now
    @space.validate_and_save
    render :action=>:form,:back => index_url
  end

  def edit
    @space = Space.find @params['id']
    if @space
      render :action=>:form,:back => index_url
    else
      object_not_found
    end
  end

  def update
    @space = Space.find @params['id']
    if @space
      @space.attributes = @params['space']
      @space.updated_at = Time.now
      if @space.validate_and_save
        redirect index_url
      else
        render :action=>:form,:back => index_url
      end
    else
      object_not_found
    end
  end

  def delete
    @space = Space.find @params['id']
    if @space
      @space.before_delete
      @space.destroy
      redirect index_url
    else
      object_not_found
    end
  end
private

  def index_url
    url_for :controller=>:Space, :action=>:index,:query=>{:t=>@space.t,:src_t=>@space.src_t,:src_id=>@space.src_id}
  end
end