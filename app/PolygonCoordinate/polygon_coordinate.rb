class PolygonCoordinate
  include Rhom::FixedSchema

  # Uncomment the following line to enable sync with Building.
  enable :sync

  set :sync_priority, 7
  set :schema_version, '1.0'

  belongs_to :boundary_polygon_id, 'BoundaryPolygon'

  #add model specifc code here
  property :boundary_polygon_id, :string
  property :point_no, :integer
  property :latitude, :string
  property :longitude, :string
  property :elevation, :string
  property :created_at, :time
  property :updated_at, :time

  index :index_polygon_coordinate_on_polygon,[:boundary_polygon_id,:point_no]

end