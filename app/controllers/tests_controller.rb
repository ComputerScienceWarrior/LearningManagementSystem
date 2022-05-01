class TestsController < ApplicationController
    before_action :find_test, only: [:show, :edit, :update, :destroy]
    before_action :find_course, only: [:new]

    def index
        @tests = Test.all
    end

    def show
    end

    def new
        @test = Test.new
    end

    def create
        @test = Test.new(test_params)
        if @test.save
            redirect_to test_path(@test)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @test.update(test_params)
            redirect_to test_path(@test)
        else
            render :edit
            flash[:success] = 'Test successfully updated!'
        end
    end

    def destroy
        @test.destroy
        redirect_to root_path
    end

    private 

    def find_test
        @test = Test.friendly.find(params[:id])
    end

    def find_course
        @course = Course.friendly.find(params[:course_id])
    end

    def test_params
        params.require(:test).permit(:title, :course_id, :user_id, :questions)
    end
end
