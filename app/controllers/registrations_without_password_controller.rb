class RegistrationsWithoutPasswordController < Devise::RegistrationsController
    def update
        binding.pry
      @user = User.find(params[:id])
      if @user.update_without_password(user_params)
        redirect_to @user, notice: 'Profile was successfully updated.'
      else
        render :edit
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email)
    end
  end
  