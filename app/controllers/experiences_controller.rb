class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @experiences = policy_scope(Experience).order(created_at: :desc)
  end

  def show
    @experience = Experience.find(params[:id])
    authorize @experience
  end

  def new
    @experience = Experience.new
    authorize @experience
  end

  def create
    @experience = Experience.new(experiences_params)
    authorize @experience
    if @experience.save
      redirect_to @experience
    else
      render :new
    end
  end

  def edit
    authorize @experience
  end

  def update
    authorize @experience
  end

  def destroy
    authorize @experience
  end

  private

  def experiences_params
    params.require(:experience).permit(:name, :description, photos: [])

  end


end