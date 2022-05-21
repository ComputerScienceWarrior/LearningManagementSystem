class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]

    def index
        @user = User.all
    end

    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            @user.update(slug: @user.full_name.parameterize)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    def destroy
        @user.destroy
        redirect_to root_path
    end

    private

    def find_user
        @user = User.friendly.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :grade, :gpa, :course_id)
    end
end
