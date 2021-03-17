class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'アニメ' },
    { id: 3, name: '漫画' },
    { id: 4, name: 'ゲーム' },
    { id: 5, name: '少女漫画' },
    { id: 6, name: '美少女' },
    { id: 7, name: 'BL' },
    { id: 8, name: 'アート' },
    { id: 9, name: '劇画' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :fixes
  end