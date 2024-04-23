class Type < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '赤ワイン' },
    { id: 3, name: '白ワイン' },
    { id: 4, name: 'ロゼワイン' },
    { id: 5, name: 'オレンジワイン' },
    { id: 6, name: 'スパークリングワイン' },
    { id: 7, name: 'その他（ポートワンやシェリーなど）' }
  ]

  include ActiveHash::Associations
  has_many :wines
end
