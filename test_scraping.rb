require 'open-uri'
require 'nokogiri'
require 'csv'

base_url = 'https://fikas.shop/'
url = "#{base_url}?mode=cate&cbid=2336012&csid=10&sort=n"

CSV.open("products.csv", "w") do |csv|
  
  csv << ["Product Name"]


  loop do
    sleep 1

    html = URI.open(url).read
    doc = Nokogiri::HTML.parse(html)
    doc.css('ul.itemList.inviewfadeIn li h1').each do |h1|
      product_name = h1.text.strip
      puts product_name  # コンソールに出力
      csv << [product_name]  # CSVファイルに書き込み
    end
    next_link = doc.at_css('a.icon.icon_next')
    break unless next_link
    next_href = next_link.attribute('href')
    url = "#{base_url}#{next_href}"
  end

end  