class Fix < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  attribute :new_image
  has_many :messages, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre


  with_options presence: true do
    validates :title
    validates :comment
    validates :image
    validates :user_id
    validates :genre_id, numericality: { other_than: 1 }
  end

  validate if: :image do
    if image.respond_to?(:content_type)
      unless image.content_type.in?(ALLOWED_CONTENT_TYPES)
        errors.add(:image, :invalid_image_type)
      end
    else
      errors.add(:image, :invalid)
    end
  end

end
