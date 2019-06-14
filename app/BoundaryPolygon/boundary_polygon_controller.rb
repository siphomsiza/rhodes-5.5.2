require 'rho/rhocontroller'
require 'helpers/browser_helper'

class BoundaryPolygonController < Rho::RhoController
  include BrowserHelper

  def index
    @facility = Facility.find(@params['facility_id'])
    @boundary_polygons = BoundaryPolygon.find(:all,:conditions=>{:facility_id=>@facility.object})
    render :back=> url_for(:controller=>:Facility,:action=>:show,:id=>@facility.object)
  end

  def show
    redirect :action=>:edit,:id=>@params['id']
  end

  def new
    @facility = Facility.find(@params['facility_id'])
    @boundary_polygon = BoundaryPolygon.new
    @boundary_polygon.facility_id = @facility.object
    render :action=>:form,:back => url_for(:controller=>:BoundaryPolygon,:action=>:index,:query=>{:facility_id=>@boundary_polygon.facility_id})
  end

  def create
    @boundary_polygon = BoundaryPolygon.new(@params['boundary_polygon'])
    @boundary_polygon.created_at = Time.now
    if @boundary_polygon.validate_and_save
      redirect :action=>:edit,:id=>@boundary_polygon.object, :query=>{:facility_id=>@boundary_polygon.facility_id}
    else
      @facility = Facility.find(@boundary_polygon.facility_id)
      render :action=>:form,:back => url_for(:controller=>:BoundaryPolygon,:action=>:index,:query=>{:facility_id=>@boundary_polygon.facility_id})
    end
  end

  def edit
    @boundary_polygon = BoundaryPolygon.find(@params['id'])
    @facility = Facility.find(@boundary_polygon.facility_id)
    @show_current = !@params['show_current'].nil? && (@params['show_current'] == 'true')
    if GeoLocation.known_position?
      c = PolygonCoordinate.find(:first,:select=>'point_no',:conditions=>{:boundary_polygon_id=>@boundary_polygon.object},:order=>"point_no",:orderdir=>'DESC')
      @new_coordinate = PolygonCoordinate.new
      @new_coordinate.boundary_polygon_id = @boundary_polygon.object
      @new_coordinate.point_no = c.nil? ? 1 : c.point_no.to_i+1 #'%02d' % (c.nil? ? 1 : c.position.to_i+1)
    end
    render :action=>:form,:back => url_for(:controller=>:BoundaryPolygon,:action=>:index,:query=>{:facility_id=>@boundary_polygon.facility_id})
  end

  def update
    @boundary_polygon = BoundaryPolygon.find(@params['id'])
    if @boundary_polygon
      @boundary_polygon.update_attributes(@params['boundary_polygon'].merge({'updated_at'=>Time.now}))
      redirect :action=>:index,:query=>{:facility_id=>@boundary_polygon.facility_id}
    else
      Alert.show_popup :message=>'Internal error: Object not found',:buttons => ['Ok']
      redirect :controller=>:Facility,:action=>:index
    end
  end

  def delete
    @boundary_polygon = BoundaryPolygon.find(@params['id'])
    if @boundary_polygon
      url = url_for :action=>:index,:query=>{:facility_id=> @boundary_polygon.facility_id}
      @boundary_polygon.before_delete
      @boundary_polygon.destroy
    else
      Alert.show_popup :message=>'Internal error: Object not found',:buttons => ['Ok']
      url = url_for :conteroller=>:Facility,:action=>:index
    end
    redirect url
  end

  def showmap
    @boundary_polygon = BoundaryPolygon.find(@params['id'])
    if @boundary_polygon
      @facility = Facility.find(@boundary_polygon.facility_id)
      map_params = {
           :provider => @params['provider'],
           :settings => {:map_type => "hybrid", :region => [@boundary_polygon.polygon_coordinates[0].latitude.to_f, @boundary_polygon.polygon_coordinates[0].longitude.to_f, 0.2, 0.2],
                         :zoom_enabled => true, :scroll_enabled => true, :shows_user_location => true},
           :annotations => @boundary_polygon.polygon_coordinates.inject([]) {|annotations,coordinate| annotations << {:latitude => coordinate.latitude, :longitude => coordinate.longitude, :title => coordinate.point_no,:subtitle=>''} }
           }
      MapView.create map_params
      render :action => :form, :back=> url_for(:action=>:form,:id=>@boundary_polygin.object)
    else
      Alert.show_popup :message=>'Internal error: Object not found',:buttons => ['Ok']
      redirect :controller=>:Facility,:action=>:index
    end
  end

end

