class AlbumsController < ApplicationController
    before_action :set_album, only: [:destroy]

    # GET albums/new
    def new
        @album = Album.new
    end

    # POST albums/new
    def create
        Album.create(album_params)

        redirect_to root_path
    end

    # GET albums/:id
    def show
        @album = Album.with_attached_images.find(params[:id])
    end

    # DELETE albums/:id
    def destroy
        if params[:image_id]
            @album.images.find_by_id(params[:image_id]).purge
        else
            @album.destroy
    
            redirect_to root_path
        end
    end

    private
        def set_album
            @album = current_user.albums.find(params[:id])   
        end

        def album_params
            params.require(:album).permit(:user_id, :description, :header_image, images: [])
        end
end