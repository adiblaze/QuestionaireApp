class SegmentsController < ApplicationController

  load_and_authorize_resource
  before_action :set_segment, only: [:show, :edit]
  before_action :authenticate_user!, :only => [:show, :index]

  def index
    @segments = Segment.all
  end

  def show
  end

  def new
    @segment = Segment.new
  end

  def edit
  end

  def create
    @segment = Segment.new(segment_params)

    respond_to do |format|
      if @segment.save
        format.html { redirect_to @segment, notice: 'Segment was successfully created.' }
        format.json { render :show, status: :created, location: @segment }
      else
        format.html { render :new }
        format.json { render json: @segment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    segment = Segment.find(params[:id])
    @segments = Segment.all
    respond_to do |format|
      if segment.update(segment_params)
        format.js
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    segment = Segment.find(params[:id])
    segment.destroy
    @segments = Segment.all # After destroy give update list of all segment
    respond_to do |format|
      format.js
    end
  end

  private

    def set_segment
      @segment = Segment.find(params[:id])
    end

    def segment_params
      params.require(:segment).permit(:name , :exam_id)
    end

end
