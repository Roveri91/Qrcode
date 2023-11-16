class ProfileController < ApplicationController
  before_action :set_profile, only: :show

  def index
    @profiles = Profile.all
  end

  def show
  end

  def create
  end

  def delete
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :surname, :birthday, :linkedln, :qrcode )
  end


end
