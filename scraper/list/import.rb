require 'open-uri'
require 'csv'

# CSVファイルのパスをRails.root.joinを使用して指定
csv_file_path = Rails.root.join('scraper', 'list', 'list_import_to_tables.csv')

CSV.foreach(csv_file_path, headers: true) do |row|
  # grape_variety_idが空の場合はnilを設定
  grape_variety_id = row['grape_variety_id'].present? ? row['grape_variety_id'] : nil

  wine = Wine.create!(
    name: row['name'],
    producer: row['producer'],
    type_id: row['type_id'],
    grape_variety_id:,
    region_id: row['region_id']
    # 画像はこの時点ではまだ紐付けない
  )

  # 画像URLからの画像ファイルのダウンロードと紐付け
  if row['image'].present?
    begin
      # 画像のURLを取得
      image_url = row['image']
      # URI.openを使って一時ファイルとして画像をダウンロード
      downloaded_image = URI.open(image_url)
      # ActiveStorageを使用して画像を紐付け
      wine.image.attach(io: downloaded_image, filename: File.basename(URI.parse(image_url).path))
    rescue OpenURI::HTTPError => e
      puts "画像のダウンロードに失敗しました: #{e.message}"
    ensure
      # ダウンロードした一時ファイルを閉じる
      downloaded_image.close if downloaded_image
    end
    # 外部サーバーに負荷をかけないように少し待つ
    sleep(1)
  end
end
