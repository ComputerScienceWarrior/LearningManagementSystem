class CoursesController < ApplicationController
    before_action :find_course, only: [:show, :edit, :update, :destroy]
    
    def index
        @courses = Course.all
    end

    def show
    end

    def new 
        @course = Course.new
    end

    def create
        @course = Course.new(course_params)
        if @course.save
            flash[:success] = 'Course successfully created!'
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @course.update(course_params)
            flash[:success] = 'Course successfully updated!'
            redirect_to course_path(@course)
        else
            flash[:error] = 'Course could not be created!'
            render :edit
        end
    end

    def destroy
        @course.destroy
        redirect_to user_path(current_user)
    end

    private 

    def find_course
        @course = Course.find(params[:course_id])
    end

    def course_params
        params.require(:course).permit(:title, :subject, :description, :user_id)
    end
end
