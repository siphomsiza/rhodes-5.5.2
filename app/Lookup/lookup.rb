class Lookup
  include Rhom::FixedSchema

  # Uncomment the following line to enable sync with Building.
  enable :sync
  #set :partition, :app
  set :sync_priority, 1 #should sync first
  set :schema_version, '1.0'

  #add model specifc code here
  property :label, :string
  property :description, :string
  property :type, :string
  property :parent_id, :string
  property :created_at, :string
  property :updated_at, :string

  index :index_lookup_on_label,[:type,:label]
  index :index_lookup_on_parent_id, [:type,:parent_id]

  def self.find_all_by_type(type,by_group=nil)
    Lookup.find(:all, :conditions=>{:type=>type},:order=>['label']).inject({}) do |arr,t|
      grp = t.parent_id.empty? ? ( by_group ? 'Other' : 0) : Lookup.find(t.parent_id).label
      arr[grp] = (arr[grp] || []) << [t.description.empty? ? t.label : t.description,t.object]
      arr
    end
  end

  def self.find_all_by_type_and_parent(type,parent_type,parent_label)
    Lookup.find(:all, :conditions=>{:type=>type,:parent_id=>Lookup.find_first_by_type_and_label(parent_type,parent_label).object},:order=>['label']).inject({0=>[]}) {|arr,t| arr[0] << [t.description,t.object]; arr}
  end

  def self.find_all_by_type_and_parent_id(type,parent_id)
    Lookup.find(:all, :conditions=>{:type=>type,:parent_id=>parent_id},:order=>['label']).inject({0=>[]}) {|arr,t| arr[0] << [t.description,t.object]; arr}
  end

  def self.find_first_by_type_and_label(type,label)
    Lookup.find :first,:select=>['object'],:conditions=>{:type=>type,:label=>label}
  end

end
