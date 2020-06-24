class ImagesController < ApplicationController
  # GET /images/new
  def new
    @image = Image.new
  end

  # POST /images
  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def image_params
    params.require(:image).permit(:url)
  end
end
