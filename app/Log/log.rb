# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here

class Log
  include Rhom::FixedSchema

  # Uncomment the following line to enable sync with Facility.
  enable :sync

  # Set the current version of the fixed schema.
  # Your application may use it for data migrations.
  set :sync_priority, 999
  set :schema_version, '1.0'

  #add model specifc code here


  property :login,:string
  property :event_type_id,:string
  property :session_key,:string
  property :client_ip,:string
  property :additional_property_1,:string
  property :additional_property_2,:string
  property :additional_property_3,:string

  property :created_on,:time

  @@latitude = 0
  @@longitude = 0
  @@accuracy = 0

  def Log.get_position
    [@@latitude,@@longitutde,@@accuracy]
  end

  def Log.set_position(lat=nil,lng=nil,acc=nil)
    @@latitude = lat
    @@longitude = lng
    @@accuracy = acc
  end

  def self.record event_type,value1=nil,value2=nil,value3=nil
    self.record_data event_type, Rho::RhoConnectClient.userName, value1, value2, value3
  end

  def self.record_data event_type,user_name,value1=nil,value2=nil,value3=nil
    value3 =  @@accuracy ? "#{@@latitude},#{@@longitude}" : "Not known position" if event_type == 'OFFLINE_SAVE_CHANGES'
    t = Lookup.find(:first,:conditions=>{:type=>'EventType',:label=>event_type})
    if t
      log = Log.create({"login"=> user_name,
                  "client_ip"=>Rhom::Rhom::client_id,
                  "created_on"=>Time.now,
                  "event_type_id"=>t.object,
                  "additional_property_1"=>value1,"additional_property_2"=>value2,"additional_property_3"=>value3})
      return log
    else
      puts "AUDIT LOG:#{event_type}|#{user_name}|#{value1}|#{value2}|#{value3}"
    end
  end
end
