class Resume < ApplicationRecord
  validates :attachment, presence: true

  belongs_to :user
  belongs_to :job

  mount_uploader :attachment, AttachmentUploader

end
