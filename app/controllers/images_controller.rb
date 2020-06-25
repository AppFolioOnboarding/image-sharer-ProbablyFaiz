class ImagesController < ApplicationController
  before_action :set_image, only: %i[show destroy]

  def index
    if index_params[:tag].present?
      @images = Image.tagged_with(index_params[:tag])
      redirect_to images_path, notice: 'No images found for that tag.' if @images.empty?
    else
      @images = Image.all
    end
    @images = @images.order(created_at: :desc)
    @tag_filters = Image.tag_counts_on(:tags).map(&:name) || []
  end

  # GET /images/1
  def show
    @tags_string = @image.tag_list.join(', ')
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # POST /images
  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to @image, notice: 'Image was successfully created.'
    else
      render :new, notice: 'Failed to create the image.', status: :unprocessable_entity
    end
  end

  def destroy
    @image.destroy
    redirect_to images_path, notice: 'Image was successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_image
    @image = Image.find(show_params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to images_path, notice: 'The specified image could not be found.'
  end

  def index_params
    params.permit(:tag)
  end

  def show_params
    params.permit(:id)
  end

  def image_params
    params.require(:image).permit(:url, :tag_list)
  end
end
