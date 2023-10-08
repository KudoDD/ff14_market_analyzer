# frozen_string_literal: true

require "net/http"
require "json"
require 'uri'

module ApiUtil
  def do_request(path, param = {})
    url = URI.parse(File.join(api_url, path))
    url.query = URI.encode_www_form param

    puts "do request. method: #{caller[0][/`([^']*)'/, 1]}"
    resp = Net::HTTP.get_response url
    puts "request complete. status: #{resp.code}"

    return nil unless resp.code == "200"

    JSON.parse resp.body
  end

  def api_param(param)
    URI.encode_www_form(param)
  end
end
