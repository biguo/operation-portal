class Admin::SessionController < ApplicationController
  require 'digest/md5'

  def index
    redirect_to :action => 'new'
  end

  def new
  end

  def new_json(method_name,auth,*args)
    jj = yield(args)
    # kkk = '[' + {
    #     :jsonrpc => "2.0",
    #     :method => method_name,
    #     :id=> 1,
    #     :auth => nil,
    #     :params => jj
    # }.to_json.gsub(/[\[\]]/, '') + ']'

    return jj  
  end
  # Brackets

  #   用户登录
  def create
    # user = User.where('username = ? and password = ?',user_params[:username].strip,Digest::MD5.hexdigest(user_params[:password].downcase)).first
    # if user
    @customers = '[
    {
        "jsonrpc": "2.0",
        "method": "user.login",
        "params": {
        "user": "Admin",
        "password": "zabbix"
    },
        "id": 1,
        "auth": null
    }
]'
    @d = new_json('user.login',nil,:user => 'Admin',:password => 'zabbix'){|args|
      args.to_json.remove_brackets
    }

    # send_data('http://170.10.10.215/zabbix/api_jsonrpc.php',@d)

      puts  @customers

      # cookies[:user_id] = {:value => user.id.to_s, :domain => '', :path => '/', :secure => false}
      # cookies[:auth] = {:value => user.auth.to_s, :domain => '', :path => '/', :secure => false}
      # cookies.each do |x,y|
      #   puts x + ' => ' + y + "\r"
      # end
      # redirect_to "/app/sessions/new"
    # else
    #   cookies.delete(:user_id, :domain => '')
    #   cookies.delete(:auth, :domain => '')
    #   flash[:warn] = 'The username or password is incorrect. Please enter the correct one！'
    #   redirect_to '/admin/session/new'
    # end
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
