# NGPVAN Public Event Listing

This gem wraps two different ways that EveryAction / VAN allows mapping of Events that are available via the API to the 
public URLs for those events where members of the public can signup. 

There is not an officially documented API for either mechanism, and which one to use depends on your EveryAction or VAN site. 

If your instance of EveryAction is setup to use the public event listing that NGPVAN support staff might variously describe 
as the "Drupal site" or "Public Site" that exists at `yourcustomername.ngpvanhost.com` then use the `public-site` option provided by this gem. 

This option wraps an unofficial JSON feed that your NGPVAN support staff might be able to provide you credentials for. 

If your instance of EveryAction is setup to use "Online Action Forms" and your event signup forms live at URLs that looks like 
`https://secure.ngpvan.com/p/xyzabc` then use the `event-list` option of this gem. This screen scrapes the HTML of an EveryAction Event List page
to map NGPVAN event IDs to form URLs.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ngpvan-public-event-listing'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ngpvan-public-event-listing

## Usage

Both modes should return the same mapping that includes NGPVAN Event ID, and the public URL where that event lives. They
are just different ways of retrieving the same info depending on which mechanism your instance is using to publish public event pages. 

### public-site

```ruby
client = NgpvanPublicEventListing.new(mode: 'public-site', hostname: 'yourcustomername.ngpvanhost.com', username: 'api', password: 'xxx' )
client.events

```

### event-list

```ruby
# event_list is a public event_list url where your public events can be listed, we'll scrape this URL
client = NgpvanPublicEventListing.new(mode: 'event-list', event_list: 'https://secure.ngpvan.com/p/xxx')
client.events

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/controlshift/ngpvan-public-event-listing. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in this codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/controlshift/ngpvan-public-event-listing/blob/master/CODE_OF_CONDUCT.md).
