# Scruber UserAgents

This gem provides user agents dictionary for Scruber gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'scruber-user-agents'
```

And then execute:

    $ bundle

Then install it with following command:
    
    $ scruber generate user_agents:install

Then edit your config/initializers/user_agents.rb manually to load user agents:

    Scruber::Helpers::UserAgentRotator.configure do
      clean
      set_filter :all

      # How to access proxy_list dictionary
      # 
      loop :user_agents do |ua|
        add ua['name'], tags: ua['tags'].split(',').map(&:strip)
      end
    end

## Usage

Fetcher will rotate User Agents automatically based on your filter in config/initializers/user_agents.rb
Possible filters:

```ruby
set_filter :all # If you want to rotate all user agents
set_filter :chrome # if you want to rotate only chrome User Agents
set_filter [:chrome, :linux] # if you want to rotate only Chrome User Agents for Linux
```

You also can generate User Agent string manually:

```ruby
Scruber::Helpers::UserAgentRotator.next([:desktop, :chrome])
```

Available tags:

    Operation Systems
      :windows
      :macos
      :linux
      :android
      :ios
    Browsers
      :chrome
      :ie
      :android_browser
      :opera_mini
      :firefox
      :uc
      :opera
      :safari
    Hardware
      :pc
      :mobile
      :phone
      :tablet


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/scruber/scruber-user-agents.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
