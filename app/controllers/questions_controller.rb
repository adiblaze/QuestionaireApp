class QuestionsController < ApplicationController

  before_action :set_question, only: [:show, :edit, :update, :destroy]

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
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy

    respond_to do |format|
      format.html {redirect_to questions_url, notice: 'Question was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  # def option_match

  # end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:question, :option_a, :option_b, :option_c, :option_d, :answer, :segment_id)
  end
end
