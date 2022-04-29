class SettingsController < ApplicationController
  before_action :set_setting, only: %i[edit update destroy]

  def new
    @setting = Setting.new
    @setting.header_color = :header_color
    @setting.body_color = :body_color
    @setting.font_size = :font_size
  end

  def create
    Setting.create(setting_params)

    redirect_to root_path, notice: 'Ваши настройки применены'
  end

  def update
    @setting.update(setting_params)

    redirect_to root_path, notice: 'Ваши настройки были обновлены'
  end

  def destroy
    @setting.destroy

    redirect_to root_path, notice: 'Ваши настройки были сброшены'
  end

  def edit
  end


  private

  def setting_params
    params.require(:setting).permit(:header_color, :body_color, :font_size, :user_id)
  end

  def set_setting
    @setting = Setting.find(params[:id])
  end
end
