class ExamsController < ApplicationController
  load_and_authorize_resource
  before_action :set_exam, only: [:show, :edit]
  before_action :authenticate_user!, :only => [:show, :index]

  # # GET /exams
  # GET /exams.json
  def index
    @exams = Exam.all
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
  end

  # GET /exams/new
  def new
    @exam = Exam.new
  end

  # GET /exams/1/edit
  def edit
  end

  # POST /exams
  # POST /exams.json
  def create
    @exam = current_user.exams.new(exam_params)

    respond_to do |format|
      if @exam.save
        format.html { redirect_to @exam, notice: 'Exam was successfully created.' }
        format.json { render :show, status: :created, location: @exam }
      else
        format.html { render :new }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    exam = Exam.find(params[:id])
    @exams = Exam.all
    respond_to do |format|
      if exam.update(exam_params)
        format.js
      else
        format.html { render :edit }

      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    exam = Exam.find(params[:id])
    exam.destroy
    @exams = Exam.all
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_params
      params.require(:exam).permit(:title)
    end
end
