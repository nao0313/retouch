class Message < ApplicationRecord
  belongs_to :fix
  belongs_to :user
  has_one_attached :avatar

  with_options presence: true do
    validates :comment, unless: :was_attached?
    validates :user_id
    validates :fix_id
  end



  def was_attached?
    self.avatar.attached?
  end
end
