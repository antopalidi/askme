class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :notfound
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def redirect_with_alert
    redirect_to root_path, alert: "Вам сюда нельзя! Зарегистрируйтесь или войдите"
  end

  def notfound
    render file: 'public/404.html', status: :not_found, layout: true
  end
end
