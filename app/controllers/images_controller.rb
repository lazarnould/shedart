class ImagesController < ApplicationController
  before_action :find_image, only: [:edit, :update, :destroy]

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.workshop = Workshop.find(params[:workshop_id])
    if @image.save
      flash[:notice] = "Image successfully added"
      redirect_to workshop_path(@image.workshop)
    else
      flash[:notice] = "An error occured, try again"
      render :new
    end
  end

  def edit
  end

  def update
    @image.update(image_params)
    redirect_to workshop_path(@image.workshop)
  end

  def destroy
    @image.destroy
    redirect_to workshop_path(@image.workshop)
  end

  private

  def find_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:photo, :photo_cache)
  end
end
