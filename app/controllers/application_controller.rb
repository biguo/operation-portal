class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Authenticated,CoreExtensions
  helper :all # include all helpers, all the time
  before_filter :set_privacy
  require_core_ext

  def proof_code(len)
    chars = ('1'..'9').to_a
    code_array = []
    1.upto(len) {code_array << chars[rand(chars.length)]}
    return code_array.to_s
  end

  def send_data(url,data)
    require 'net/http'
    require 'uri'
    require 'json'

    uri = URI.parse(url)
    puts uri.inspect
    req = Net::HTTP::Post.new(url,{'Content-Type' => 'application/json'})
    req.body = data
    res = Net::HTTP.new(uri.host,uri.port).start{|http| http.request(req)}
    puts res.body
  end

  private
  def set_privacy
    response.headers["P3P"]=%|CP="NOI DSP COR NID ADMa OPTa OUR NOR"|
  end

end
