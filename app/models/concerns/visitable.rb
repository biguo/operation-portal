require 'active_support/concern'


module Visitable
  extend ActiveSupport::Concern

  included do

    def self.new_json(method_name, auth, *args)
      params = args[0]
      params = yield(params) if block_given?
      [{
           'id' => 1,
           'jsonrpc' => "2.0",
           'method' => method_name,
           'auth' => auth,
           'params' => params
       }].to_json
    end

    def self.visit(url, data,aim = '')
      puts report = self.send_data(url, data)
      # log = Log.create :content => data,:aim => aim, :report => report
      report
    end

    def self.send_data(url, data)
      require 'net/http'
      require 'uri'
      require 'json'
      uri = URI.parse(url)
      req = Net::HTTP::Post.new(url, {'Content-Type' => 'application/json'})
      req.body = data
      res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }
      return res.body
    end

  end

end