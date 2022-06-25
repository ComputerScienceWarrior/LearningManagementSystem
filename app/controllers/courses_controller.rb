class CoursesController < ApplicationController
    before_action :find_course, only: [:show, :edit, :update, :destroy, :enroll]
    before_action :find_user, only: [:index, :new]
    
    def index
        @courses = @user.courses.all
    end

    def all_courses
        @courses = Course.all
    end

    def show
    end

    def new 
        @course = Course.new
    end

    def create  
        @course = current_user.courses.new(course_params)
        if @course.save
            redirect_to user_course_path(current_user, @course)
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

    #enroll a user in course the course
    def enroll
        @course.students << current_user.id
        current_user.update(enrolled_courses: [*current_user.enrolled_courses, @course.id])
        redirect_to course_path(@course)
    end

    private 

    def find_course
        @course = Course.friendly.find(params[:id] || params[:course_id])
    end

    def find_user
        @user = User.friendly.find(params[:user_id])
    end

    def course_params
        params.require(:course).permit(:title, :subject, :description, :students, :user_id)
    end
end
