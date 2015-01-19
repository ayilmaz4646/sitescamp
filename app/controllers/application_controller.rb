class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale

  def current_locale
    I18n.locale
  end
  helper_method :current_locale

  private

  def set_locale
    #locale = logged_in? ? current_user.locale : (params[:locale])
    if params[:locale].present?
      locale = params[:locale]
      cookies[:modaltrans_locale] = locale
    elsif user_signed_in?
      locale = current_user.language if current_user
    end
    unless locale.present?
      locale = cookies[:modaltrans_locale]
    end
    unless locale.present?
      locale = ((lang = request.env['HTTP_ACCEPT_LANGUAGE']) && lang[/^[a-z]{2}/])
    end
    unless locale.present?
      locale = Timeout::timeout(5) { Net::HTTP.get_response(URI.parse('http://api.hostip.info/country.php?ip=' + request.remote_ip )).body } rescue I18n.default_locale
      cookies[:modaltrans_locale] = locale
    end

    I18n.locale = (locale.present? && I18n.available_locales.include?(locale.to_sym)) ? locale : I18n.default_locale
  end

end
