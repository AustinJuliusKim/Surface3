class ProfilesController < ApplicationController

  def new
    
  end

  def create
    @user = User.find(params[:id])
    @profile = @user.profile.new(profile_params)
    @profile.save
    redirect_to user_path
  end

  private
  def profile_params
    params.require(:profile).permit(:fullname, :gender, :age, :looking_for, :bio)
  end

end
