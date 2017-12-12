class QuestionsController < ApplicationController

  load_and_authorize_resource
  before_action :set_question, only: [:show, :edit]
  before_action :authenticate_user!, :only => [:show, :index]

  def index
    @questions = Question.paginate(page: params[:page], :per_page => 1)
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: "Question was created successfully." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html {render :new}
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    question = Question.find(params[:id])
    @questions = Question.paginate(page: params[:page], :per_page => 1).order("created_at")

    if @questions.length > 0

      page = page
      # @questions.total_pages == @questions.current_page

      # redirect_to questions_path(page: @questions.current_page)
    end
    redirect_to questions_path(page: page)

    respond_to do |format|
      if question.update(question_params)
        format.js
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    @questions = Question.paginate(page: params[:page], :per_page => 1)
    respond_to do |format|
      format.js
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    #params.require(:question).permit(:question, :option_a, :option_b, :option_c, :option_d, :answer)
    params.require(:question).permit(:question,choices_attributes: [:id, :option])
  end
end
