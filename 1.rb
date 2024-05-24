# frozen_string_literal: true

require 'faraday'
require 'dotenv/load'
require 'json'

api_user = 'API_KEY'
api_key = ENV['API_KEY']
athlete_id = 'i18792'

intervals = Faraday.new(url: 'https://intervals.icu/api/v1/') do |faraday|
  faraday.response :logger
  faraday.request :authorization, :basic, api_user, api_key
end

response = intervals.get("athlete/#{athlete_id}/profile")
pp response.body

response = intervals.get("athlete/#{athlete_id}/activities", { oldest: '2024-04-01', newest: '2024-04-08' })
activities = JSON.parse(response.body)
activity = activities.first
pp activity
File.write('out/activity.json', JSON.pretty_generate(activity))
