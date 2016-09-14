class ProfilesController < ApplicationController

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :address, :phone_number, :photo, :photo_cache)
  end

  def find_profile
    @profile = Profile.find(params[:id])
  end
end
