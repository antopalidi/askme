class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[update destroy edit]
  before_action :set_question_for_current_user, only: %i[update destroy edit hide]

  def create
    question_params = params.require(:question).permit(:body, :answer, :user_id, :author_id, :hide)

    @question = Question.new(question_params)
    @question.author = current_user

    if check_captcha(@question) && @question.save
      redirect_to user_path(@question.user), notice: 'Новый вопрос создан'
    else
      flash.now[:alert] = 'При попытке создать вопрос вознилки ошибки!'
      render :edit
    end
  end

  def update
    question_params = params.require(:question).permit(:body, :answer)

    if @question.update(question_params)
      redirect_to user_path(@question.user), notice: 'Вопрос сохранен'
    else
      flash.now[:alert] = 'При попытке сохранить вопрос вознилки ошибки!'
      render :edit
    end
  end

  def destroy
    @user = @question.user
    @question.destroy

    redirect_to user_path(@user), notice: 'Вопрос удален'
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @hashtags = Hashtag.with_questions.all
    @questions = Question.includes(%i[user author]).order(created_at: :desc)
    @users = User.order(created_at: :desc).last(10)
  end

  def new
    @user = User.friendly.find(params[:user_id])
    @question = Question.new(user: @user)
  end

  def edit; end

  def hide
    @question.update(hidden: true)

    redirect_to questions_path, notice: 'Вопрос скрыт'
  end

  private

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end

  def check_captcha(model)
    current_user.present? || verify_recaptcha(model: model)
  end
end
