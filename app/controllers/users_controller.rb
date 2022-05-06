class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :authorize_user, only: %i[edit update destroy]

  def new
    session[:current_time] = Time.now
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id

      redirect_to root_path, notice: "Welcome, #{@user.nickname}"
    else
      flash.now[:alert] = 'Вы неправильно заполнили поля регистрации!'
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)

      redirect_to root_path, notice: "#{@user.nickname}, ваши данные обновлены"
    else
      flash.now[:alert] = 'При попытке сохранить данные вознилки ошибки!'

      render :edit
    end
  end

  def destroy
    @user.destroy

    session.delete(:user_id)

    redirect_to root_path, notice: "Пользователь #{@user.nickname} удален"
  end

  def show
    @question = Question.new(user: @user)
    @questions = @user.questions.order(created_at: :desc)
  end

  private

  def authorize_user
    redirect_with_alert unless current_user == @user
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :nickname, :email, :header_color, :password, :password_confirmation)
  end
end
