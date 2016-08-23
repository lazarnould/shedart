class WorkshopsController < ApplicationController
  before_action :find_workshop, only: [:edit, :update, :show, :destroy]

  def new
    @workshop = Workshop.new
  end

  def create
    @workshop = Workshop.new(workshop_params)
    @workshop.user = current_user
    if @workshop.save
      flash[:success] = "Your workshop in #{@workshop.city} has been created"
      redirect_to workshop_path(@workshop)
    else
      flash[:alert] = "An error occured, try again"
      render :new
    end
  end

  def edit
  end

  def update
    @workshop.update(workshop_params)
    redirect_to workshop_path(@workshop)
  end

  def show
  end

  def index
    @workshops = Workshop.all
  end

  def destroy
    @workshop.destroy
    redirect_to root_path
  end

  private

  def workshop_params
    params.require(:workshop).permit(:city, :address, :size, :price, :shared)
  end

  def find_workshop
    @workshop = Workshop.find(params[:id])
  end
end
