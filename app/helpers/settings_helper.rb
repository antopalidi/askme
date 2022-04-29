module SettingsHelper
  def header_color
    @header_color = user_setting&.header_color || '#370617'
  end

  def body_color
    @body_color = user_setting&.body_color || '#03071E'
  end

  def font_size
    @font_size = user_setting&.font_size || '100'
  end

  def user_setting
    @settings ||= Setting.find_by(user_id: session[:user_id]) if session[:user_id]
  end
end
