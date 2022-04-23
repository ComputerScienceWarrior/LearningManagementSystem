class SessionsController < ApplicationController
    
    def sign_up
        @user = User.new
    end

    def login
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            flash[:notice] = 'You have successfully logged in!'
            redirect_to user_path(@user)
        else
            flash[:warning] = @user.errors.messages
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
