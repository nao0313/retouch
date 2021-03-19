class Message < ApplicationRecord
  belongs_to :fix
  belongs_to :user
  has_one_attached :avatar

  with_options presence: true do
    validates :comment, unless: :was_attached?
    validates :user_id
    validates :fix_id
  end

  validate if: :image do
    if avatar.respond_to?(:content_type)
      unless avatar.content_type.in?(ALLOWED_CONTENT_TYPES)
        errors.add(:avatar, :invalid_avatar_type)
      end
    else
      errors.add(:avatar, :invalid)
    end
  end

  def was_attached?
    self.avatar.attached?
  end
end
