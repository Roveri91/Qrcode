class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :destroy]

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
    # if @profile.save
    #   redirect_to profile_path(@profile)
    # else
    #   render :new
    # end

    respond_to do |format|
      if @profile.save
        format.turbo_stream { render :create, locals: { profile: @profile } }
      end
    end
  end

  def destroy
    @profile.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :surname, :birthday, :linkedln, :qrcode )
  end


end
