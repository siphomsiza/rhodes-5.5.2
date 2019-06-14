require 'rho/rhocontroller'
require 'helpers/browser_helper'
require 'helpers/application_helper'

class FixtureController < Rho::RhoController
  include BrowserHelper
  include ApplicationHelper

  def index
    @space = Space.find @params['space_id']
    if @space
      @fixtures = Fixture.find :all, :conditions=>{:space_id=>@space.object}
      render :action=>:index, :back=>url_for(:controller=>:Space,:action=>:edit,:id=>@space.object)
    else
      object_not_found
    end
  end

  def show
    @fixture = Fixture.find @params['id']
    if @fixture
      redirect url_for(:action=>:edit, :id=>@fixture.object)
    else
      object_not_found
    end
  end

  def new
    @space = Space.find @params['space_id']
    if @space
      @fixture = Fixture.new({:space_id=>@space.object,:present=>'true'})
      render :action=>:form,:back=>index_url
    else
      object_not_found
    end
  end

  def create
    @fixture = Fixture.new(@params['fixture'])
    @fixture.created_at = Time.now
    @space = Space.find @fixture.space_id
    if @fixture.validate_and_save
      redirect index_url
    else
      render :action=>:form, :back=> index_url
    end
  end

  def edit
    @fixture = Fixture.find @params['id']
    @space = Space.find @fixture.space_id
    if @fixture
      render :action=>:form,:back=>index_url
    else
      object_not_found
    end
  end

  def update
    @fixture = Fixture.find @params['id']
    if @fixture
      @space = Space.find @fixture.space_id
      @fixture.attributes = @params['fixture']
      @fixture.updated_at = Time.now
      if @fixture.validate_and_save
        redirect index_url
      else
        render :action=>:form,:back=>index_url
      end
    else
     object_not_found
    end
  end

  # POST /Fixture/{1}/delete
  def delete
    @fixture = Fixture.find @params['id']
    if @fixture
      @space = Space.find @fixture.space_id
      @fixture.destroy
      redirect index_url
    else
      object_not_found
    end
  end

private

  def index_url
    url_for :action=>:index,:query=>{:space_id=>@space.object}
  end
end