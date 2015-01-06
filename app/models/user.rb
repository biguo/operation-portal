class User < ActiveRecord::Base

  include Visitable

  def self.login(*args)
    data = self.new_json('user.login',nil,args[0])
    self.visit(Constant::ZABBIX_URL,data,'user.login')
  end

end
