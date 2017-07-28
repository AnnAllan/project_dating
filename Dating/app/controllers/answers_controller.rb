class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @question_id = Question.last.id
  end

  def create
    @answer = Answer.new(safe_answer_params)
    if @answer.save
      flash.now[:success] = "Answers created"
      redirect_to new_answer_path
    else
      flash.now[:error] = "Answers not created"
      render 'new'
    end
  end

  private
  def safe_answer_params
    params.require(:answer).permit(:content, :question_id)
  end
end
