class UsersController < ApplicationController
  def new
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      session[:user_id] = @user.id
      redirect_to root_path, notice: "#{@user.nickname}, ваши данные обновлены"
    else
      flash.now[:alert] = 'При попытке сохранить данные вознилки ошибки!'
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    session.delete(:user_id)

    redirect_to root_path, notice: "Пользователь #{@user.nickname} удален"
  end

  def show
    @user = User.find(params[:id])
    @questions = @user.questions
    @question = Question.new(user: @user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :email, :header_color, :password, :password_confirmation)
  end
end
