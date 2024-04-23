require 'open-uri'
require 'nokogiri'
require 'csv'

base_url = 'https://fikas.shop/'
url = "#{base_url}?mode=grp&gid=1698625&sort=n"

CSV.open('white.csv', 'w:bom|utf-8') do |csv|
  csv << ['Product Name'] # CSVのヘッダーを追加

  loop do
    sleep 1

    html = URI.open(url).read
    doc = Nokogiri::HTML.parse(html)
    doc.css('ul.itemList.inviewfadeIn li').each do |li|
      product_name = li.css('h1').text.strip # 商品名を取得
      image_url = li.css('div.photo img').first['src'] # 画像URLを取得

      puts "#{product_name}, #{image_url}" # コンソールに出力
      csv << [product_name, image_url] # CSVファイルに書き込み
    end
    next_link = doc.at_css('a.icon.icon_next')
    break unless next_link

    next_href = next_link.attribute('href')
    url = "#{base_url}#{next_href}"
  end
end
