class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  mount_uploader :image, ImageUploader

  validates :text_or_image, presence: true

  def text_or_image
    body || image
  end
end
