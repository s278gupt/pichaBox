class Album < ApplicationRecord
    belongs_to :user

    has_one_attached :header_image
    has_many_attached :images

    validates :description, presence: true
    validates :header_image, presence: true
    validate :image_type

    def image_resize index
        image = ActiveStorage::Attachment.find(index)
        return image.variant(resize: '500x500').processed
    end

    private
    def image_type
        errors.add(:images, "please select images") unless images.attached?

        images.each do |img|
            if !img.content_type.in?(%('image/jpeg' 'image/png'))
                errors.add(:images, 'needs to be a JPEG or PNG')
            end
        end
    end
end
