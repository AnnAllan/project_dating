class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @ranks = Rank.all
    @answers = Answer.all
  end

  def show
    @questions = Question.all
    @ranks = Rank.all
    @answers = Answer.all
    @user = User.find(params[:id])
    @question = Question.find(params[:id])
    @users_questions_answers_ranks = User.find(params[:id])
  end

  def new
    @question = Question.new
    @current_user = User.find(5)

  end

  def create
    @question = Question.create(safe_question_params)
    if @question.save
      flash[:success] = "Question created, please add answers."
      redirect_to new_answer_path
    else
      flash.now[:error] = "Unable to create question. "
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
  end

  def destroy

  end

  private
  def safe_question_params
    params.require(:question).permit(:content, :user_id)
  end
end
