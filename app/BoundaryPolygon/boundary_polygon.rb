require 'lib/model'

class BoundaryPolygon
  include Rhom::FixedSchema
  include Model

  # Uncomment the following line to enable sync with Building.
  enable :sync

  set :sync_priority, 6
  set :schema_version, '1.0'

  belongs_to :facility_id, 'Facility'

  #add model specifc code here
  property :facility_id, :string
  property :polygon_type_id, :string
  property :remarks, :string
  property :created_at, :time
  property :updated_at, :time

  index :index_boundary_polygon_on_facility,[:facility_id,:polygon_type_id]

  def before_delete
    polygon_coordinates.each { |c| c.destroy }
  end

  def polygon_type_text
    Lookup.find(self.polygon_type_id).description
  end

  def polygon_coordinates
    @apolygon_coordinates = PolygonCoordinate.find(:all,:conditions=>{:boundary_polygon_id=>self.object},:order=>'point_no') if @apolygon_coordinates.nil?
    @apolygon_coordinates
  end

  def validate
    self.errors[:polygon_type_id] ='has already been taken' if BoundaryPolygon.find(:first,:conditions=>{:facility_id=>self.facility_id,:polygon_type_id=>self.polygon_type_id})
  end

end