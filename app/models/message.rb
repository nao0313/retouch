class Message < ApplicationRecord
  belongs_to :fix
  belongs_to :user
  has_one_attached :avatar

  with_options presence: true do
    validates :comment
    validates :user_id
    validates :fix_id
  end
