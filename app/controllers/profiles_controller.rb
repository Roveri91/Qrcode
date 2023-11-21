class ProfilesController < ApplicationController
  before_action :set_profile, only: :show

  def index
    @profiles = Profile.all
  end

  def show
    @qrcode = RQRCode::QRCode.new(@profile.linkedln).as_png
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.save
  end

  def delete
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :surname, :birthday, :linkedln, :qrcode )
  end


end
