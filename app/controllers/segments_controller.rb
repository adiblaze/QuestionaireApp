class SegmentsController < ApplicationController

  before_action :set_segment, only: [:show, :edit, :update]

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
    respond_to do |format|
      if @segment.update(segment_params)
        format.html { redirect_to @segment, notice: 'Segment was successfully updated.' }
        format.json { render :show, status: :ok, location: @segment }
      else
        format.html { render :edit }
        format.json { render json: @segment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    segment = Segment.find(params[:id])
    segment.destroy
    @segments = Segment.all # After destroy give update list of all segment
    respond_to do |format|
      format.js
      # format.html {redirect_to segments_url, notice: 'Segment was successfully destroyed.'}
      # format.json {head :no_content}
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
