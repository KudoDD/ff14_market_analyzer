# frozen_string_literal: true

require "net/http"

class FF14MarketAnalyzer
  def self.extract_kinsaku_item
    # マーケット取引できるアイテムの取得

    # 以下の条件に当てはまるアイテムのみに絞る
    #  - 自サーバの平均価格が30万ギル以上100万ギル未満
    #  - 自サーバの月平均取引数15以上

    # 結果出力
    #  - アイテム名
    #  - 自サーバ情報
    #    - 自サーバの平均価格
    #    - 自サーバの月平均取引数
    #  - 他サーバ情報
    #    - 他サーバの平均価格
    #    - 他サーバの月平均取引数
  end
end

FF14MarketAnalyzer.extract_kinsaku_item if __FILE__ == $0
