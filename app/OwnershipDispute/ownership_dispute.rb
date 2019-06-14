# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
require 'lib/model'

class OwnershipDispute
  include Rhom::FixedSchema
  include Model

  # Uncomment the following line to enable sync with Facility.
  enable :sync

  # Set the current version of the fixed schema.
  # Your application may use it for data migrations.
  set :sync_priority, 13
  set :schema_version, '1.0'

  #add model specifc code here

  belongs_to :municipal_roll_register_id, 'AssetInformation'

  property :municipal_roll_register_id,:string

  property :dispute_no,:string
  property :description,:string
  property :name_of_claimant,:string
  property :dispute_status_id,:string
  property :date_of_registration,:string
  property :dispute_result,:string

  property :created_at,:time
  property :updated_at,:time

  index :index_ownership_dispute_on_no, [:municipal_roll_register_id,:dispute_no]

  def validate
    self.errors[:date_of_registration] = "can't be blank" if self.date_of_registration.nil? || self.date_of_registration.empty?
    self.errors[:name_of_claimant] = "can't be blank" if self.name_of_claimant.nil? || self.name_of_claimant.empty?
    self.errors[:description] = "can't be blank" if self.description.nil? || self.description.empty?
    if self.dispute_no.nil? || self.dispute_no.empty?
      self.errors[:dispute_no] = "can't be blank"
    else
      self.errors[:dispute_no] = "has already been taken" unless self.unique?({:municipal_roll_register_id=>self.municipal_roll_register_id,:dispute_no=>self.dispute_no})
    end
  end
  def dispute_status_text
    Lookup.find(self.dispute_status_id).description
  end
end

