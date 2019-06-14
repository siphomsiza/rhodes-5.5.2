# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
require 'lib/model'

class Fixture
  include Rhom::FixedSchema
  include Model

  # Uncomment the following line to enable sync with Facility.
  enable :sync

  # Set the current version of the fixed schema.
  # Your application may use it for data migrations.
  set :schema_version, '1.0'
  set :sync_priority, 21
  belongs_to :space_id, 'Space'

  property :space_id, :string
  property :fixture_type_id, :string
  property :present, :string
  property :condition_id, :string
  property :comments, :string

  property :created_at, :time
  property :updated_at, :time

  def fixture_type_text
    Lookup.find(self.fixture_type_id).description
  end

  def condition_text
    Lookup.find(self.condition_id).description
  end

  def validate
    self.errors[:condition_id] = "can't be blank" if self.present == 'true' && (self.condition_id.nil? || self.condition_id.empty?)
    self.errors[:fixture_type_id] = "has already been taken" unless self.unique?({:space_id=>self.space_id,:fixture_type_id=>self.fixture_type_id})
  end

end