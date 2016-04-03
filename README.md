# OmniAuth Pushbullet

This gem contains an OmniAuth strategy for [Pushbullet](https://www.pushbullet.com/) using their OAuth2 authentication API.

Before using this gem, you will need to register an application with Pushbullet through their website.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-pushbullet'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-pushbullet

## Usage

Integrate the strategy as middleware in any Rack app by editing `config.ru`:

```ruby
use OmniAuth::Builder do
  provider :pushbullet, ENV['CLIENT_ID'], ENV['CLIENT_SECRET']
end
```

If you're using Rails, there's a slightly different variation. Add the following to a file of your choice in config/initializers:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :pushbullet, ENV['CLIENT_ID'], ENV['CLIENT_SECRET']
end
```

The `CLIENT_ID` and `CLIENT_SECRET` are obtained from Pushbullet after registering your application.

The remaining integration steps are explained in the [README for OmniAuth](https://github.com/intridea/omniauth#integrating-omniauth-into-your-application)

## Development

After checking out the repo, run `bin/setup` or `bundle install` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install the gem with your local changes onto your machine, run `bundle exec rake install`.

## Contributing

1. Fork it ( http://github.com/nevern02/omniauth-pushbullet/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

