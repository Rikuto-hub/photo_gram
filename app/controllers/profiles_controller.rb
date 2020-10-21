class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def show
      @profile = current_user.profile
  end

  def edit
      @profile = current_user.prepare_profile
  end

  def update
    @profile = current_user.prepare_profile
    @profile.assign_attributes(profile_params)
    if @profile.save
      redirect_to profile_path, notice: 'プロフィール更新！'
    else
      flash.now[:error] = '更新に失敗'
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(
      :name,
      :user_name,
      :introduce,
      :web,
      :gender,
      :number,
      :email,
      :icon
    )
  end    
end