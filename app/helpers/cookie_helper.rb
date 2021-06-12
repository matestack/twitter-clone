module CookieHelper

  def current_username
    cookies[:username]
  end

end