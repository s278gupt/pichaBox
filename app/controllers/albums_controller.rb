class AlbumsController < ApplicationController
    before_action :set_album, only: [:destroy, :edit, :update]

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
        @album.destroy

        redirect_to root_path
    end

    # DELETE albums/:id/image_attachment
    def delete_image_attachment
        @image = ActiveStorage::Attachment.find(params[:id])
        @image.purge    

        redirect_back(fallback_location: root_path) 
    end

    # GET albums/:id/edit
    def edit
    end

    def update
        @album.update(description: params[:album][:description], images: params[:album][:images])
        redirect_back(fallback_location: root_path)
    end
    
    private
        def set_album
            @album = current_user.albums.find(params[:id])   
        end

        def album_params
            params.require(:album).permit(:user_id, :description, :header_image, images: [])
        end
end
