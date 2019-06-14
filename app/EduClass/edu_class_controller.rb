require 'rho/rhocontroller'
require 'helpers/browser_helper'
require 'helpers/application_helper'

class EduClassController < Rho::RhoController
  include BrowserHelper
  include ApplicationHelper

  def index
    @facility = Facility.find @params['facility_id']
    if @facility
      @edu_classes = EduClass.find :all, :conditions=>{:facility_id => @params['facility_id']}
      render :action=>:index, :back=>url_for(:controller=>:Facility,:action=>:show,:id=>@facility.object,:query=>{'box'=>'3'})
    else
      object_not_found
    end
  end

  def new
    @facility = Facility.find @params['facility_id']
    if @facility
      @edu_class = EduClass.new({:facility_id => @params['facility_id']})
      render :action=>:form,:back=>url_for(:controller=>:EduClass,:action=>:index,:query=>{:facility_id=>@facility.object})
    else
      object_not_found
    end
  end

  def create
    @edu_class = EduClass.new(@params['edu_class'])
    @edu_class.created_at = time.now
    @facility = Facility.find @edu_class.facility_id
    if @edu_class.validate_and_save
      redirect url_for(:controller=>:EduClass,:action=>:index,:query=>{:facility_id=>@facility.object})
    else
      render :action=>:form,:back=>url_for(:controller=>:Facility,:action=>:show,:id=>@facility.object)
    end
  end

  def show
    redirect url_for(:controller=>:EduClass,:action=>:edit,:id=>@params['id'])
  end

  def edit
    @edu_class = EduClass.find @params['id']
    if @edu_class
      @facility = Facility.find @edu_class.facility_id
      render :action=>:form, :back=>url_for(:controller=>:EduClass,:action=>:index,:query=>{:facility_id=>@facility.object})
    else
      object_not_found
    end
  end

  def update
    @edu_class = EduClass.find @params['id']
    if @edu_class
      @facility = Facility.find @edu_class.facility_id
      @edu_class.attributes = @params['edu_class']
      @edu_class.updated_at = Time.now
      if @edu_class.validate_and_save
        redirect url_for(:controller=>:EduClass,:action=>:index,:query=>{:facility_id=>@facility.object})
      else
        render :action=>:form,:back=>url_for(:controller=>:Facility,:action=>:show,:id=>@facility.object)
      end
    else
      object_not_found
    end
  end

  def delete
    @edu_class = EduClass.find @params['id']
    if @edu_class
      @facility = Facility.find @edu_class.facility_id
      @edu_class.destroy
      redirect url_for(:controller=>:EduClass,:action=>:index,:query=>{:facility_id=>@facility.object})
    else
      object_not_found
    end
  end


end