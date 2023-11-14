class ProfileController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def show
  end

  def create
  end

  def delete
  end
end
