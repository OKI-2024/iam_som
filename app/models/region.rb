class Region < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'アメリカ合衆国' },
    { id: 3, name: 'アルジェリア' },
    { id: 4, name: 'アルゼンチン' },
    { id: 5, name: 'イタリア' },
    { id: 6, name: 'インド' },
    { id: 7, name: 'ウクライナ' },
    { id: 8, name: 'ウルグアイ' },
    { id: 9, name: 'オーストラリア' },
    { id: 10, name: 'オーストリア' },
    { id: 11, name: 'カナダ' },
    { id: 12, name: 'ギリシャ' },
    { id: 13, name: 'グルジア' },
    { id: 14, name: 'スイス' },
    { id: 15, name: 'スペイン' },
    { id: 16, name: 'セルビア' },
    { id: 17, name: 'チェコ' },
    { id: 18, name: '中国' },
    { id: 19, name: 'チリ' },
    { id: 20, name: 'ドイツ' },
    { id: 21, name: '日本' },
    { id: 22, name: 'ニュージーランド' },
    { id: 23, name: 'ハンガリー' },
    { id: 24, name: 'ブラジル' },
    { id: 25, name: 'フランス' },
    { id: 26, name: 'ブルガリア' },
    { id: 27, name: 'ペルー' },
    { id: 28, name: 'ポルトガル' },
    { id: 29, name: 'モルドバ' },
    { id: 30, name: 'ルーマニア' },
    { id: 31, name: 'ロシア' },
    { id: 32, name: '南アフリカ' },
    { id: 33, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :wines
end
