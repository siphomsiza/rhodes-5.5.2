require 'rho/rhocontroller'

class PolygonCoordinateController < Rho::RhoController
  def show
    @polygon_coordinate = PolygonCoordinate.find @params['id']
    if @polygon_coordinate
      redirect url_for :controller=> BoundaryPolygon,:action=>:edit,:id=>@polygon_coordinate.boundary_polygon_id
    else
      Alert.show_popup :message=>'Internal error: Object not found',:buttons => ['Ok']
      redirect url_for :controller=>:Facility,:action=>:index
    end
  end

  def create
    @polygon_coordinate = PolygonCoordinate.new(@params['polygon_coordinate'])
    @polygon_coordinate.created_at = Time.now
    @polygon_coordinate.save
    redirect url_for(:controller=>:BoundaryPolygon,:action=>:edit,:id=>@polygon_coordinate.boundary_polygon_id,:query=>{:show_current=>@params['show_current']})
  end

  def delete
    @polygon_coordinate = PolygonCoordinate.find @params['id']
    if @polygon_coordinate
      boundary_polygon_id = @polygon_coordinate.boundary_polygon_id
      @polygon_coordinate.destroy
      redirect url_for(:controller=>:BoundaryPolygon,:action=>:edit,:id=>boundary_polygon_id,:query=>{:show_current=>@params['show_current']})
    else
      Alert.show_popup :message=>'Internal error: Object not found',:buttons => ['Ok']
      redirect url_for(:controller=>:BoundaryPolygon,:action=>:index)
    end
  end

  def move
    polygon_coordinate = PolygonCoordinate.find(@params['id'])
    polygon_coordinate.point_no = polygon_coordinate.point_no + @params['to'].to_i #'%02d' % (polygon_coordinate.point_no.to_i + @params['to'].to_i).to_s
    polygon_coordinate1 = PolygonCoordinate.find(:first,:select=>'point_no',:conditions=>{:boundary_polygon_id=>polygon_coordinate.boundary_polygon_id,:point_no=>polygon_coordinate.point_no})
    polygon_coordinate1.point_no = polygon_coordinate1.point_no - @params['to'].to_i#'%02d' % (polygon_coordinate1.point_no.to_i - @params['to'].to_i).to_s
    polygon_coordinate1.save
    polygon_coordinate.save
    redirect url_for(:controller=>:BoundaryPolygon,:action=>:edit,:id=>polygon_coordinate.boundary_polygon_id)
  end
end
