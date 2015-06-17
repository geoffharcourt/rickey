# Rickey

Rickey queries MLBAM's servers for information about transactions in Major and
Minor League Baseball.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rickey'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rickey

## Usage

You specify a date to fetch transactions:

```ruby
Rickey.new(date: Date.new(2015, 6, 1)).fetch
```

You can query for minor leagues or rookie ball:

```ruby
Rickey.new(date: Date.new(2015, 6, 1), sport_code: "aaa").fetch
```

You can query for a specific team's transactions:

```ruby
# Cardinals transactions on 6/5/2015
Rickey.new(date: Date.new(2015, 6, 5), team_id: 138).fetch
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rickey. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

Moneyball is © 2015 Geoff Harcourt. It is free software, and may be redistributed under the terms specified in the LICENSE file.

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


