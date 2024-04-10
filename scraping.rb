require 'open-uri'
require 'nokogiri'

url = 'https://www.yahoo.co.jp/'

# urlにアクセスしてhtmlを取得する
html = URI.open(url).read

# 取得したhtmlをNokogiriでパースする
doc = Nokogiri::HTML.parse(html)

# ニュースの見出しを取得して出力する
doc.at_css('section#tabpanelTopics1 ul').css('h1').each do |h1|
  puts h1.text.strip
end

#このコードは、Nokogiriを使用してヤフージャパンのトップページからニュース見出しを抽出するものです。以下にそれぞれの部分の解説を行います。
#doc.at_css('section#tabpanelTopics1 ul'):

#doc: パースされたHTMLドキュメントオブジェクト。
#at_css('selector'): 指定されたCSSセレクタに一致する最初の要素を取得するメソッド。この場合、'section#tabpanelTopics1 ul' はCSSセレクタで、section 要素の中で id 属性が tabpanelTopics1 である要素の中の ul 要素を指定しています。つまり、この部分のコードはヤフージャパンのトップページで id が tabpanelTopics1 であるセクション内の ul 要素を取得します。
#.css('h1'):

#css('selector'): 指定されたCSSセレクタに一致するすべての要素を取得するメソッド。この場合、'h1' は h1 タグに一致する要素を指定しています。つまり、この部分のコードは前のステップで取得した ul 要素内のすべての h1 要素を取得します。
#.each do |h1|:

#.each: 配列やNodeSet（Nokogiriの場合）などの要素を順番に処理するためのメソッド。この場合、取得した h1 要素それぞれに対して指定された処理が行われます。
#|h1|: ブロックパラメータとして使用され、各 h1 要素がこの変数に代入されます。
#puts h1.text.strip:

#h1.text.strip: h1 要素のテキスト内容を取得し、前後の空白文字を削除します。
#puts: テキスト内容を標準出力に表示します。
#つまり、このコードはヤフージャパンのトップページから特定のセクション内のニュース見出しを抽出し、それらを１つずつ改行して表示します。