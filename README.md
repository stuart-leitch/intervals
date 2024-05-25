# intervals

Playing with the Intervals.icu API and cleaning my data

## Description

I accidentally uploaded duplicates of a load of my cycling activities to Garmin Connect and from there they made their way to Strava and then Intervals.icu.

This wee project is to identify these duplicated activities and delete them.

## Getting Started

### Dependencies

* Written in ruby 

### Installing

* clone the repo
* fetch your API key from intervals.icu (settings page)[https://intervals.icu/settings], add it to .env file as `API_KEY=<>`
* set your intervals.icu athlete ID in .env file (find this in intervals.icu settings page)
* `bundle install`
* `bundle exec ruby delete_dups.rb`

### Executing program

* How to run the program
1. Ensure API_KEY and ATHLETE_ID variables are set in .env
2. `bundle exec ruby 1.rb`

## Help

Be careful when using the delete  (it's commented out for safety)

Note that strava's API does not allow deletion of an activity (but you can request their support team do this for you)

Garmin don't allow API access for non enterprise developers, and don't help with bulk deletion.  So this script will generate the Garmin URL for and activity so that you can open it in the browser and manually delete :(

## Authors

Contributors names and contact info

Stuart Leitch


## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details

## Acknowledgments

Inspiration, code snippets, etc.
* [INtervals.icu API Docs](https://intervals.icu/api-docs.html)
* [PurpleBooth](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)
* [dbader](https://github.com/dbader/readme-template)
* [zenorocha](https://gist.github.com/zenorocha/4526327)
* [fvcproductions](https://gist.github.com/fvcproductions/1bfc2d4aecb01a834b46)