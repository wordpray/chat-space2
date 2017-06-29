class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  mount_uploader :image, ImageUploader

  validates :body_or_image, presence: true
  validates :group_id, presence: true
  validates :user_id, presence: true

  def body_or_image
    body || image
  end
end
