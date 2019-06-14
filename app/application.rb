require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    # Tab items are loaded left->right, @tabs[0] is leftmost tab in the tab-bar
    # Super must be called *after* settings @tabs!
    @tabs = nil
    #To remove default toolbar uncomment next line:
    #@@toolbar = nil
    super
    #@default_menu = {
    #  "Sync" => :sync,
    #  "View Log" => :log,
    #  "Close" => :close
    #}
    # Uncomment to set sync notification callback to /app/Settings/sync_notify.
    Rho::RhoConnectClient.pollInterval = 0
    #SyncEngine::set_objectnotify_url("/app/Settings/sync_object_notify")
    Rho::RhoConnectClient.setNotification("*", "/app/Settings/sync_notify", '')
    Rho::RhoConnectClient.showStatusPopup = false
    GeoLocation.set_notification "/app/Settings/geo_callback", "", 3
  end

  def on_sync_user_changed
    super
  end

  def on_activate_app
    puts "on_activate_app"
  end
end
