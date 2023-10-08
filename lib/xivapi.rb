# frozen_string_literal: true

require File.join(File.expand_path(File.dirname(__FILE__)), "../lib/api_util")

class XivApi
  extend ApiUtil

  XIVAPI_API_URL = "https://xivapi.com/"

  def self.item(item_id)
    param = {
      language: "ja",
      columns: "Name"
    }
    do_request "item/#{item_id}", param
  end

  def self.api_url
    XIVAPI_API_URL 
  end
end
