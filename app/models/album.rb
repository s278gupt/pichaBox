class Album < ApplicationRecord
    belongs_to :user

    has_one_attached :header_image
    has_many_attached :images
end
