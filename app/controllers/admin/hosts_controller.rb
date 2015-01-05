class Admin::HostsController < ApplicationController
  before_filter :is_logged

  def index
    @customers = [{
                      "jsonrpc" => "2.0",
                      "method" => "apiinfo.version",
                      "id" => 1,
                      "auth" => nil,
                      "params" => {}
                  }].to_json


#     @customers = '[
# {
#                     "jsonrpc":"2.0",
#                     "method":"apiinfo.version",
#                     "id":1,
#                     "auth":null,
#                     "params":{}
#                   }
# ]'
#     @customers = '[
#     {
#         "jsonrpc": "2.0",
#         "method": "user.login",
#         "params": {
#         "user": "Admin",
#         "password": "zabbix"
#     },
#         "id": 1,
#         "auth": null
#     }
# ]'

#     @customers =  '[{
#     "jsonrpc": "2.0",
#     "method": "host.get",
#     "params": {
#         "output": [
#             "hostid",
#             "host"
#         ],
#         "selectInterfaces": [
#             "interfaceid",
#             "ip"
#         ]
#     },
#     "id": 2,
#     "auth": "0424bd59b807674191e7d77572075f33"
# }]'
#     puts 'a'

    # send_data('http://170.10.10.215/zabbix/api_jsonrpc.php',@customers)
    # send_data('http://www.baidu.com',@customers)
  end

  def new
  end

  def create
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




end
