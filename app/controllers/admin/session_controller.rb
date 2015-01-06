class Admin::SessionController < ApplicationController
  require 'digest/md5'

  def index
    redirect_to :action => 'new'
  end

  def new
  end

  #  login
  def create
   report = User.login(:user => user_params[:username],:password => user_params[:password])
   response = JSON.parse(report)[0]
   if response['result']
     cookies[:user_id] = {:value => response['id'], :domain => '', :path => '/', :secure => false}
     cookies[:auth] = {:value => response['result'], :domain => '', :path => '/', :secure => false}
     redirect_to admin_hosts_path
   else
     warn =  response['error']['data']
     cookies.delete(:user_id, :domain => '')
     cookies.delete(:auth, :domain => '')
     flash[:warn] = warn
     redirect_to new_admin_session_path
   end


  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
