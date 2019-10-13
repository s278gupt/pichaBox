class AlbumsController < ApplicationController
    def new
        @album = Album.new
    end

    def create
        Album.create(album_params)
        
        redirect_to root_path
    end

    private

    def album_params
        params.require(:album).permit(:user_id, :description, :header_image, images: [])
    end
end
