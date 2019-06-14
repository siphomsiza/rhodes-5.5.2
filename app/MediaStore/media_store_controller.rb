require 'rho/rhocontroller'
require 'helpers/application_helper'
require 'helpers/browser_helper'

class MediaStoreController < Rho::RhoController
  include ApplicationHelper
  include BrowserHelper

  def index
    @media_stores = MediaStore.find :all
    render :action => :index
  end
  # POST /MediaStore/{1}/delete
  def delete
    @media_store = MediaStore.find(@params['id'])
    if @media_store
      url = url_for(:controller=>@media_store.src_t.to_sym, :action=>:edit, :id=>@media_store.src_id,:query=>{:block=>@params['block']})
      Log.record 'OFFLINE_SAVE_CHANGES', "Delete #{@media_store.t}",@media_store.src_code
      @media_store.destroy
      redirect url
    else
      object_not_found
    end
  end

  # GET /MediaStore/take_photo
  def take_photo
    $source_params = {:t=>@params['t'],:src_t=>@params['src_t'],:src_id=>@params['src_id'].to_s,:block=>@params['block']}
    opt = {}
    if Rho::RhoConfig.image_size
      case Rho::RhoConfig.image_size.to_i
        when 1 then
          opt[:desired_width]=1024
          opt[:desired_height]=768
        when 2 then
          opt[:desired_width]=800
          opt[:desired_height]=600
        when 3 then
          opt[:desired_width]=640
          opt[:desired_height]=480
      end
    end
    Camera::take_picture(url_for(:action => :camera_callback),opt)
    redirect url_for(:controller=>@params['src_t'].to_sym,:action=>:edit,:id=>@params['src_id'],:query=>{:block=>@params['block']})
  end

  # GET /MediaStore/{1}/choose_photo
  def choose_photo
    $source_params = {:t=>@params['t'],:src_t=>@params['src_t'],:src_id=>@params['src_id'].to_s,:block=>@params['block']}
    Camera::choose_picture(url_for(:action => :camera_callback))
    redirect url_for(:controller=>@params['src_t'].to_sym,:action=>:edit,:id=>@params['src_id'],:query=>{:block=>@params['block']})
  end

  def camera_callback
    if @params['status'] == 'ok'
      @media_store = MediaStore.find :first, :conditions=>{"t"=>$source_params[:t], "src_t"=>$source_params[:src_t] ,'src_id'=>$source_params[:src_id]}
      if @media_store.nil?
        @media_store = MediaStore.create({:created_at=>Time.now,:t=>$source_params[:t],:src_id=>$source_params[:src_id],:src_t=>$source_params[:src_t],:item_no=>1,:data=>@params['image_uri']})
        Log.record 'OFFLINE_SAVE_CHANGES', "Create #{@media_store.t}",@media_store.src_code
      else
        @media_store.update_attributes({:updated_at=>Time.now,:data=>@params['image_uri']})
        Log.record 'OFFLINE_SAVE_CHANGES', "Update #{@media_store.t}",@media_store.src_code
      end
    else
      Alert.show_popup(:message => @params['message'], :buttons => ["Return"]) if @params['status'] == 'error'
    end
    WebView.navigate url_for(:controller=>$source_params[:src_t].to_sym,:action=>:edit,:id=>$source_params[:src_id],:query=>{:block=>$source_params[:block]})
    ""
  end

 def camera_menu
    Alert.show_popup({
      :title => "Import To Stack",
      :icon => :question,
      :buttons => [
        { :id => "take_picture",   :title => "Take New Photo" },
        { :id => "choose_picture", :title => "Choose Existing Photo" },
        { :id => "take_video",     :title => "Take New Video" },
        { :id => "choose_video",   :title => "Choose New Video" },
        { :id => "cancel",         :title => "Back" } ],
      :callback => url_for(:action => :camera_menu_callback)
    })
 end

end
