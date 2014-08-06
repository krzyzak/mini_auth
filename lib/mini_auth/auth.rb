module MiniAuth
  module Auth
    protected
    def require_user!
      not_logged_in unless logged_in?
      not_activated unless activated?
      true
    end

    def current_user
      @current_user ||= login_from_token || login_from_cookie || login_from_custom_strategy
    end

    def current_user=(new_user)
      @current_user = new_user || @current_user || null_user
    end

    def login_from_token
      self.current_user = MiniAuth.configuration.token_strategy.call(self)
    end

    def login_from_cookie
      self.current_user = MiniAuth.configuration.cookie_strategy.call(cookies)
    end

    def login_from_custom_strategy
      self.current_user = MiniAuth.configuration.custom_strategy.call({controller: self, cookies: cookies, request: request})
    end

    def logged_in?
      current_user.present?
    end

    def activated?
      MiniAuth.configuration.activation_check.call(current_user)
    end

    def not_logged_in
      raise Error::NotLoggedIn
    end

    def not_activated
      raise Error::NotActivated
    end

    private
    def null_user
      @null_user ||= MiniAuth.configuration.null_user
    end
  end
end
