class QuestionsController < ApplicationController
    before_action :find_test, only: [:index, :create, :destroy]
    
    def index
        @questions = @test.questions
    end

    def new
        @question = Question.new
    end

    def create
        @question = @test.questions.new(question_params)
        if @question.save
            redirect_to test_question_path(@test, @question)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @question.update(question_params)
            redirect_to question_path(@question)
        else
            render :edit
            flash[:success] = 'Question successfully updated!'
        end
    end

    def destroy
        @question.destroy
        redirect_to test_path(@test)
    end

    private 

    def find_question
        @question = Question.friendly.find(params[:id])
    end

    def find_test
        @test = Test.friendly.find(params[:test_id])
    end

    def question_params
        params.require(:question).permit(:header, :options, :answer, :question_type, :test_id)
    end
end
