class ProfileController < ApplicationController
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
