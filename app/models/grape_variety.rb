class GrapeVariety < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'カベルネ・ソーヴィニヨン' },
    { id: 3, name: 'メルロー' },
    { id: 4, name: 'ピノ・ノワール' },
    { id: 5, name: 'マスカット・べーリーA' },
    { id: 6, name: 'シラー' },
    { id: 7, name: 'テンプラニーリョ' },
    { id: 8, name: 'カルメネール' },
    { id: 9, name: 'ネッビオーロ' },
    { id: 10, name: 'サンジョヴェーゼ' },
    { id: 11, name: 'ガルナッチャ' },
    { id: 12, name: 'マルベック' },
    { id: 13, name: 'シャルドネ' },
    { id: 14, name: 'ソーヴィニヨン・ブラン' },
    { id: 15, name: '甲州' },
    { id: 16, name: 'リースリング' },
    { id: 17, name: 'ピノ・グリ' },
    { id: 18, name: 'セミヨン' },
    { id: 19, name: 'ヴィオニエ' },
    { id: 20, name: 'マスカット・オブ・アレキサンドリア' },
    { id: 21, name: 'ミュスカデ' },
    { id: 22, name: 'マカベオ' },
    { id: 23, name: 'バロミノ' },
    { id: 24, name: 'フルミント' },
    { id: 25, name: 'その他（選択肢にない・ブレンドなど）' }
  ]

  include ActiveHash::Associations
  has_many :wines
end
