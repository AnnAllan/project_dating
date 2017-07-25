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
  end

  def create
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
  end

  def destroy

  end
end
