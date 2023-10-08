# frozen_string_literal: true

require File.join(File.expand_path(File.dirname(__FILE__)), "../lib/api_util")

class UniversalisApi
  extend ApiUtil

  UNIVERSALIS_BASE_URL = "https://universalis.app"
  UNIVERSALIS_API_URL = File.join(UNIVERSALIS_BASE_URL, "api/v2")

  module ApiPath
    MARKETABLE_ITEM = "marketable"
  end

  module DC
    GAIA = "Gaia"
    MANA = "Mana"
    ELEMENTAL = "Elemental"
    METEOR = "Meteor"

    JP_DC = [
      GAIA,
      MANA,
      ELEMENTAL,
      METEOR
    ]
  end

  module World
    Tiamat = "Tiamat"
  end

  HOME_WORLD = World::Tiamat

  def self.marketable_item
    do_request ApiPath::MARKETABLE_ITEM
  end

  def self.market_board_current_data(item_ids, world_dc_region = HOME_WORLD)
    do_request File.join(world_dc_region, item_ids.join(","))
  end

  def self.api_url
    UNIVERSALIS_API_URL
  end
end
