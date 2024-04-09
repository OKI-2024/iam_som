class Fragrance < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ブラックベリーの風味' },
    { id: 2, name: 'チェリーキャンディの香り' },
    { id: 3, name: 'ブルーベリーの香り' },
    { id: 4, name: 'オレンジピールの風味' },
    { id: 5, name: 'レモンの爽やかな香り' },
    { id: 6, name: 'グレープフルーツの香り' },
    { id: 7, name: '桃のフレッシュな香り' },
    { id: 8, name: 'パイナップルの甘い香り' },
    { id: 9, name: 'バニラビーンズの風味' },
    { id: 10, name: 'ダークチョコレートの香り' },
    { id: 11, name: 'キャラメルの香り' },
    { id: 12, name: 'メープルシロップの風味' },
    { id: 13, name: 'コーヒーの香り' },
    { id: 14, name: 'アールグレイティーの香り' },
    { id: 15, name: 'ミントの爽快な香り' },
    { id: 16, name: 'シナモンスティックの風味' },
    { id: 17, name: 'クローブのスパイシーな香り' },
    { id: 18, name: 'バターのリッチな風味' },
    { id: 19, name: 'トーストしたパンの風味' },
    { id: 20, name: 'オークのエレガントな香り' }
  ]

  include ActiveHash::Associations
  has_many :reviews

  end