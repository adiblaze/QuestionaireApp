class UsersController < ApplicationController
  # def index
  #   @exams = Exam.all
  # end

  # def exam_segment
  #   @exam = Exam.find(params[:exam_id])
  #   @segments = @exam.segments
  # end

  # def show_question
  #   @segment =  Segment.find(params[:segment_id])
  #   @questions =  @segment.questions
  # end

  # def user_answer
  #   @errors = []
  #   segment = Segment.find(params[:segment_id])
  #   params[:user_answers].permit!
  #   byebug
  #   if params[:user_answers].present? && params[:user_answers].to_h.count == segment.questions.count

  #     params[:user_answers].to_h.each do |key, value|
  #       begin
  #         current_user.user_answers.create(question_id: key, user_answer: value)
  #       rescue
  #         @questions = segment.questions
  #         render "show_question"
  #       end
  #     end
  #     redirect_to exam_segment_users_path(exam_id: segment.exam_id)
  #   else
  #     @errors << "Please attempt all the questions and dont refresh the page!"
  #     @questions = segment.questions
  #     render "show_question"
  #   end
  # end

end
