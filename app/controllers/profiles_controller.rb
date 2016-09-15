class ProfilesController < ApplicationController
  before_action :find_profile, only: [:edit, :update, :show]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user
    if @profile.save
      flash[:success] = "You're profile has been created"
      redirect_to profile_path(@profile)
    else
      flash[:error] = "An error occured, please try again"
      render :new
    end
  end

  def edit
  end

  def update
    @profile.update(profile_params)
    redirect_to profile_path(@profile)
  end

  def show
    if @profile.nil?
      redirect_to new_profile_path
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :address, :country, :zip_code, :city, :phone_number, :photo, :photo_cache)
  end

  def find_profile
    @profile = Profile.find(params[:id])
  end
end
