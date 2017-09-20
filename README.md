# geo.lclark.edu

[![Build Status](https://travis-ci.org/watzek/geo.lclark.edu.svg?branch=spec_documentation)](https://travis-ci.org/watzek/geo.lclark.edu)
[![Docker Image](https://images.microbadger.com/badges/image/watzek/geo.lclark.edu.svg)](https://microbadger.com/images/watzek/geo.lclark.edu)
[![Docker Version](https://images.microbadger.com/badges/version/watzek/geo.lclark.edu.svg)](https://microbadger.com/images/watzek/geo.lclark.edu)

Lewis and Clark's [Geoblacklight](http://geoblacklight.org/) instance hosted at [geo.lclark.edu](geo.lclark.edu).

## Development

### Prerequisites

1. [PostgreSQL](https://www.digitalocean.com/community/tutorials/how-to-setup-ruby-on-rails-with-postgres).
  - Make sure it is configured in a way that it uses your current system's credential. More information can be found [here](https://stackoverflow.com/questions/24038316/rails-connects-to-database-without-username-or-password/24039062#24039062).

2. [Ruby](https://www.ruby-lang.org/en/documentation/installation/) >= 2.2.5

### Installing

1. Clone the repository:
```
git clone https://github.com/watzek/geo.lclark.edu.git
```

2. Inside `geo.lclark.edu` directory install the gems:
```
bundle install
```

3. Create and migrate database:
```
rake db:create
rake db:migrate
```

4. Test it:
```
rake test
```

5. To run the application:
```
rake geoblacklight:server
```

## Contributing

1. Make sure you fork the repository

2. Create github issue before submitting a PR

3. Write spec or integration tests using `rspec` or `capybara`

4. Make sure your commit message reads:
```
(#Issue No.) Commit message describing the change made by this patch
```

Example commit message:
```
(#23) Enable fullscreen leaflet
```

If your PR does not bring in a big change in functionality like updating documentaion, etc. you can file a "maint" PR.

Example commit message for maint PR:
```
(MAINT) Update README.md
```

Your PR will be reviewed by the maintainers once it passes all the tests through our CI.
