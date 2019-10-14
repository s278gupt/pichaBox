class Album < ApplicationRecord
    belongs_to :user

    has_one_attached :header_image
    has_many_attached :images

    validate :image_presence

    def image_presence
        errors.add(:images, "please select images") unless (images.attached? && header_image.attached?)
    end

    def image_resize index
        image = ActiveStorage::Attachment.find(index)
        return image.variant(resize: '500x500').processed
    end
end
