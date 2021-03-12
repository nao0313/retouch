class Fix < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :comment
    validates :image
    validates :user_id
    validates :genre_id, numericality: { other_than: 1 }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
end
