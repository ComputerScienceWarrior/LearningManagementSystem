class SessionsController < ApplicationController

    def login
    end

    def create
        @user = User.find_by_email(params[:email])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :login
        end
    end

    def logout
        reset_session
        flash[:notice] = 'You have successfully logged out!'
        redirect_to root_path
    end

    private

    def login_params
        params.require(:session).permit(:email, :password)
    end
end
