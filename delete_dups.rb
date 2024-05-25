# frozen_string_literal: true

require 'faraday'
require 'dotenv/load'
require 'json'
require 'terminal-table'
require 'date'

api_user = 'API_KEY'
api_key = ENV['API_KEY']
athlete_id = ENV['ATHLETE_ID']

intervals = Faraday.new(url: 'https://intervals.icu/api/v1/') do |faraday|
  faraday.response :logger
  faraday.request :authorization, :basic, api_user, api_key
end

# response = intervals.get("athlete/#{athlete_id}/profile")
# pp response.body

oldest = '2004-01-01'
newest = '2024-05-10'
response = intervals.get("athlete/#{athlete_id}/activities", { oldest:, newest: })
activities = JSON.parse(response.body)

# activity = activities.first
# pp activity
# File.write('out/activity.json', JSON.pretty_generate(activity))

table = Terminal::Table.new do |t|
  t.title = 'Activities'
  t.headings = %w[Name Type Distance Start Created Gap Device ID StravaID Strava_Url]
  activities.select { |a| a['type'] == 'Ride' }
            .select { |a| Date.parse(a['created']) == Date.parse('2024-05-13') }
            .reject { |a| a['id'] == 'i39639446' } # I wanted to keep this one - Fenix Died
            .each do |activity|
    start = Date.parse(activity['start_date_local'])
    created = Date.parse(activity['created'])
    gc_url = "https://connect.garmin.com/modern/activity/#{activity['external_id']} "
    strava_url = "https://www.strava.com/activities/#{activity['strava_id']}"
    t.add_row [activity['name'], activity['type'], activity['distance'],
               start,
               created,
               created - start,
               activity['device_name'],
               activity['id'],
               activity['strava_id'],
               strava_url]
    # intervals.delete("activity/#{activity['id']}")
  end
end
puts table
pp activities.count
