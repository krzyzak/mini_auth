module MiniAuth
  class Config
    attr_writer :token_strategy, :cookie_strategy, :custom_strategy, :null_user

    def token_strategy
      @token_strategy || proc{ nil }
    end

    def cookie_strategy
      @cookie_strategy || proc{ nil }
    end

    def custom_strategy
      @vustom_strategy || proc{ nil }
    end

    def null_user
      @null_user || NullUser.new
    end

    def activation_check
      @activation_check || proc{ true }
    end
  end
end

