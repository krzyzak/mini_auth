require "mini_auth/auth"
require "mini_auth/config"
require "mini_auth/error"
require "mini_auth/null_user"
require "mini_auth/version"

module MiniAuth
  include Auth

  def self.included(base)
    base.send :helper_method, :current_user, :logged_in? if base.respond_to? :helper_method
  end

  def self.configure
    yield configuration
  end

  def self.configuration
    @configuration ||= Config.new
  end
end
