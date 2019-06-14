# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
require 'lib/model'

class OwnerInformation
  include Rhom::FixedSchema
  include Model

  # Uncomment the following line to enable sync with Facility.
  enable :sync

  # Set the current version of the fixed schema.
  # Your application may use it for data migrations.
  set :sync_priority, 11
  set :schema_version, '1.0'

  #add model specifc code here

  belongs_to :asset_information_id, 'AssetInformation'

  property :asset_information_id,:string
  property :registration_date,:string
  property :date_of_sale,:string
  property :sale_price,:string
  property :bond_amount,:string

  property :owner_name,:string
  property :company_registration,:string
  property :address,:string
  property :owner_status_id,:string
  property :created_at, :time
  property :updated_at, :time

  index :index_owner_infromation_idx, [:asset_information_id]

  def validate
    self.errors[:owner_name] = "can't be blank" if self.owner_name.nil? || self.owner_name.empty?
    self.errors[:company_registration] = "can't be blank" if self.company_registration.nil? || self.company_registration.empty?
    self.errors[:address] = "can't be blank" if self.address.nil? || self.address.empty?
    self.errors[:registration_date] = "can't be blank" if self.registration_date.nil? || self.registration_date.empty?
    #self.errors[:owner_status_id] = "has already been taken" unless self.unique?({:asset_information_id=>self.asset_information_id,:owner_status_id=>self.owner_status_id})
  end

  def owner_status_text
    Lookup.find(self.owner_status_id).description
  end

end

