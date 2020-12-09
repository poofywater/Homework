class User < ApplicationController
    before_action :require_no_user!
   def new
    @user = User.new
    render :new
   end

   def create
    @user = User.new(user_params)
        if @user.save
            redirect_to user_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

   private
   def user_params
    params.require(:User).permit(:email, :password_digest, :session_token)
   end
end