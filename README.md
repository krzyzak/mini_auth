# MiniAuth

Bullshit–free authentication library, which ain’t smarter than you.

## Synopsis

Add this line to your application's Gemfile:

    gem 'mini_auth'

Configure your login strategies:

```ruby

MiniAuth.configure do |c|
  c.token_strategy = ->(controller) do
    controller.authenticate_with_http_token do |token, options|
      User.find_by_token(token)
    end
  end
  # c.cookie_strategy = ->(cookies){ User.find(cookies[:user_id]) }
  c.custom_strategy = ->(params){ User.first if params[:request].env["PATH_INFO"] == "something_crazy" }
end
```

By default `current_user` helper returns instance of `MiniAuth::NullUser`, but guess what? You can customise it!(eg. if you want to return instance of your custom `Guest` class) – just add

```ruby

MiniAuth.configure do |c|
  c.null_user = Guest.new
end
```


Add `before_action :require_user!` everywhere you want to require that user is logged in. `MiniAuth::Error::NotLoggedIn` will be raised, if user is not logged in.


If you want to ensure that user is activated, you can add to your config:

```ruby
MiniAuth.configure do |c|
  c.activation_check = ->(user){ user.active? } 
end
```

`MiniAuth::Error::NotActivated` will be raised if user is not active

## Contributing

1. Fork it ( https://github.com/[my-github-username]/mini_auth/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
