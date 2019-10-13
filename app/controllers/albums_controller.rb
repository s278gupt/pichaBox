class AlbumsController < ApplicationController
    # GET albums/new
    def new
        @album = Album.new
    end

    # POST albums/new
    def create
        Album.create(album_params)

        redirect_to root_path
    end

    private
        def album_params
            params.require(:album).permit(:user_id, :description, :header_image, images: [])
        end
end
