# frozen_string_literal: true

require File.join(File.expand_path(File.dirname(__FILE__)), "../lib/universalis_api")
require File.join(File.expand_path(File.dirname(__FILE__)), "../lib/xivapi")

class FF14MarketAnalyzer
  PERMIT_AVG_GIL_RANGE = 100_000..1_000_000

  def self.extract_kinsaku_item
    # マーケット取引できるアイテムの取得
    item_ids = UniversalisApi.marketable_item
    return puts "アイテム取得失敗" unless item_ids

    # 以下の条件に当てはまるアイテムのみに絞る
    #  - 自サーバの平均価格が30万ギル以上100万ギル未満
    #  - 自サーバの月平均取引数15以上
    kinsaku_info_items = {}
    item_ids.each_slice(1000) do |item_ids|
      market_data = UniversalisApi.market_board_current_data(item_ids)
      return puts "マケホ情報取得失敗" unless market_data

      target = market_data["items"].reject do |_k, v|
        !PERMIT_AVG_GIL_RANGE.cover? v["averagePrice"]
      end
      kinsaku_info_items.merge! target
    end

    # 結果出力
    #  - アイテム名
    #  - 自サーバ情報
    #    - 自サーバの平均価格
    #    - 自サーバの月平均取引数
    #  - 他サーバ情報
    #    - 他サーバの平均価格
    #    - 他サーバの月平均取引数
    req_cnt = 0
    kinsaku_info_items.each do |item_id, _v|
      p XivApi.item(item_id)

      req_cnt =+ 1
      if req_cnt > 15
        sleep 1
        req_cnt = 0
      end
    end
  end
end

FF14MarketAnalyzer.extract_kinsaku_item if __FILE__ == $0
