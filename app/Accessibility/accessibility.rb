# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
require 'lib/model'

class Accessibility
  include Rhom::FixedSchema
  include Model

  # Uncomment the following line to enable sync with Building.
  enable :sync
  #enable :full_update

  set :sync_priority, 5 #should sync after Facility
  set :schema_version, '1.0'

  #add model specifc code here
  belongs_to :facility_id, 'Facility'

  property :facility_id, :string
  property :access_feature_id, :string
  property :suitability_rating_id, :string
  property :comments, :string
  property :created_at, :time
  property :updated_at, :time

  index :index_accessibility_on_feature, [:facility_id,:access_feature_id]

  def access_feature_text
    Lookup.find(self.access_feature_id).description
  end

  def validate
    a = Accessibility.find(:first,:conditions=>{:facility_id=>self.facility_id,:access_feature_id=>self.access_feature_id})
    unless a.nil? || (a.object == self.object)
      self.errors[:access_feature_id] = 'has already been taken'
      self.errors[:msg] = 'Access Feature '+errors[:access_feature_id]
    end
  end

  def facility
    Facility.find self.facility_id
  end
  def access_feature
    Lookup.find self.access_feature_id
  end
end
