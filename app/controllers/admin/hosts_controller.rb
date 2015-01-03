class Admin::HostsController < ApplicationController
  def index
    @customers1 = [{
                     "jsonrpc" => "2.0",
                     "method" => "apiinfo.version",
                     "id" => 1,
                     "auth" => nil,
                     "params" => {}
                 }].to_json


    @customers = '[{
        "jsonrpc": "2.0",
        "method": "host.create",
        "params": {
        "host": "Linux server",
        "interfaces": [
        {
            "type": 1,
        "main": 1,
        "useip": 1,
        "ip": "192.168.3.1",
        "dns": "",
        "port": "10050"
    }
    ]
    },
        "id": 3,
        "auth": "0424bd59b807674191e7d77572075f33"
    }]';

    send_data('http://170.10.10.215/zabbix/api_jsonrpc.php',@customers)
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

  require 'net/http'
  require 'uri'
  require 'json'
  def send_data(url,data)
    uri = URI.parse(url)
    puts uri.inspect
    req = Net::HTTP::Post.new(url,{'Content-Type' => 'application/json'})
    req.body = data
    res = Net::HTTP.new(uri.host,uri.port).start{|http| http.request(req)}
    puts res.body
  end

end
