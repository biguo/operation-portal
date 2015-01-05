# 用户登录验证模块
module Authenticated
  # 必须登录的过虑器
  protected
  def login_required
    access_denied if !(cookies[:user_id])
  end

  # 当space的验证信息没有通过时的操作
  def access_denied
    respond_to do |format|
      format.html do
        flash[:warn] = "请您先登录，才能继续操作"
        unless params[:to]
          store_location
          redirect_to "/admin/session/new"
        else
          redirect_to "/admin/session/new"
        end
      end
      format.any(:json, :xml) do
        request_http_basic_authentication 'Web Password'
      end
    end
  end

  # 记住上一个URL地址
  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  # 必须登录的过虑器
  def is_logged
    if !cookies[:user_id]
      flash[:warn] = '请先登录！'
      redirect_to "/admin/session/new"
    else
      return true
    end
  end

  def url_filter
      path = Constant::URL_PREFIX+request.url.split("//")[1].split(request.url.split("//")[1].split("/")[0])[-1].split('?')[0]
      flag = true
      urls = Menu.return_menu(cookies[:user_id],Menu::MENU_FLAG[:ADMIN])
      reject_urls = []
      urls.each do |u|
        temp = Menu.get_similar_menu(u.url)
        temp.each do |reject|
          reject_urls << reject
        end
      end
      urls.each do |m|
        #允许的URL
#        p m.url
        if path.include?(m.url)

          #检查数据库中是否存在URL包含了上面判断是允许的，
          #如：/manage/role_menus被允许，但是/manage/role_menus/list不被允许
          reject_urls.each do |reject|
            if request.url.include?reject.url
              flag = false
              break
            end
          end
          return
        else
          flag = false
        end
      end
      if !flag
        flash[:warn] = '您无权访问该页面！'
        redirect_to "/admin/session/new"
      end
  end

  # available as ActionView helper methods.
  def self.included(base)
    base.send :helper_method, :current_login_space, :logged_in?, :authorized? if base.respond_to? :helper_method
  end
end
